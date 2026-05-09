; DESCRIPTION: Composite: Renders a orange disk with center (123, 176) and radius 60 then Sets a single green pixel at (88, 232) then Draws a magenta line from (434, 223) to (124, 64).
; PLAN: r0=123(x), r1=176(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=88(x), r6=232(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=434(x1), r11=223(y1), r12=124(x2), r13=64(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 123
LDI r1, 176
LDI r2, 60
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 88
LDI r6, 232
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 434
LDI r11, 223
LDI r12, 124
LDI r13, 64
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
