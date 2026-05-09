; DESCRIPTION: Composite: Places a black circle of radius 28 at center (171, 144) then Draws a magenta line from (95, 117) to (316, 75).
; PLAN: r0=171(x), r1=144(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=95(x1), r6=117(y1), r7=316(x2), r8=75(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 171
LDI r1, 144
LDI r2, 28
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 95
LDI r6, 117
LDI r7, 316
LDI r8, 75
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
