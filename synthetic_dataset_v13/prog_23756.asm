; DESCRIPTION: Composite: Places a white dot at position (38, 3) then Renders a green line between points (128, 77) and (373, 199).
; PLAN: r0=38(x), r1=3(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=128(x1), r6=77(y1), r7=373(x2), r8=199(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 38
LDI r1, 3
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 128
LDI r6, 77
LDI r7, 373
LDI r8, 199
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
