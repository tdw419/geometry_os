; DESCRIPTION: Composite: Places a yellow dot at position (217, 123) then Draws a white line from (284, 220) to (48, 25).
; PLAN: r0=217(x), r1=123(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=284(x1), r6=220(y1), r7=48(x2), r8=25(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 217
LDI r1, 123
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 284
LDI r6, 220
LDI r7, 48
LDI r8, 25
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
