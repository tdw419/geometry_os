; DESCRIPTION: Composite: Draws a blue line from (386, 20) to (5, 154) then Sets a single blue pixel at (259, 190) then Renders a orange disk with center (338, 206) and radius 42.
; PLAN: r0=386(x1), r1=20(y1), r2=5(x2), r3=154(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=259(x), r6=190(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=338(x), r11=206(y), r12=42(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 386
LDI r1, 20
LDI r2, 5
LDI r3, 154
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 259
LDI r6, 190
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 338
LDI r11, 206
LDI r12, 42
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
