; DESCRIPTION: Composite: Draws a red line from (297, 156) to (10, 255) then Sets a single orange pixel at (103, 125) then Renders a red disk with center (354, 215) and radius 30.
; PLAN: r0=297(x1), r1=156(y1), r2=10(x2), r3=255(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=103(x), r6=125(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=354(x), r11=215(y), r12=30(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 297
LDI r1, 156
LDI r2, 10
LDI r3, 255
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 125
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 354
LDI r11, 215
LDI r12, 30
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
