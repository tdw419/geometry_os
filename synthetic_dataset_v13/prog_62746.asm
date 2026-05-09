; DESCRIPTION: Composite: Places a white dot at position (499, 14) then Renders a green line between points (471, 225) and (315, 103).
; PLAN: r0=499(x), r1=14(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=471(x1), r6=225(y1), r7=315(x2), r8=103(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 499
LDI r1, 14
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 471
LDI r6, 225
LDI r7, 315
LDI r8, 103
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
