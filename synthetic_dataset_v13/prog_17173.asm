; DESCRIPTION: Composite: Renders a orange disk with center (317, 146) and radius 73 then Places a yellow dot at position (474, 27) then Draws a purple line from (297, 109) to (254, 206).
; PLAN: r0=317(x), r1=146(y), r2=73(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=474(x), r6=27(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=297(x1), r11=109(y1), r12=254(x2), r13=206(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 317
LDI r1, 146
LDI r2, 73
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 474
LDI r6, 27
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 297
LDI r11, 109
LDI r12, 254
LDI r13, 206
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
