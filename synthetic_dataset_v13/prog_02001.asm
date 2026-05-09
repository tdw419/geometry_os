; DESCRIPTION: Composite: Sets a single red pixel at (168, 194) then Places a purple circle of radius 11 at center (13, 236) then Draws a red line from (81, 183) to (290, 212).
; PLAN: r0=168(x), r1=194(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=13(x), r6=236(y), r7=11(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=81(x1), r11=183(y1), r12=290(x2), r13=212(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 168
LDI r1, 194
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 13
LDI r6, 236
LDI r7, 11
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 81
LDI r11, 183
LDI r12, 290
LDI r13, 212
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
