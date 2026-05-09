; DESCRIPTION: Composite: Draws a yellow line from (367, 249) to (259, 49) then Renders a yellow disk with center (348, 212) and radius 25.
; PLAN: r0=367(x1), r1=249(y1), r2=259(x2), r3=49(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=348(x), r6=212(y), r7=25(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 367
LDI r1, 249
LDI r2, 259
LDI r3, 49
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 348
LDI r6, 212
LDI r7, 25
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
