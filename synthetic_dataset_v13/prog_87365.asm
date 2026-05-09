; DESCRIPTION: Composite: Places a green dot at position (157, 34) then Renders a orange disk with center (28, 198) and radius 15 then Draws a magenta line from (500, 69) to (241, 13).
; PLAN: r0=157(x), r1=34(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=28(x), r6=198(y), r7=15(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=500(x1), r11=69(y1), r12=241(x2), r13=13(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 157
LDI r1, 34
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 28
LDI r6, 198
LDI r7, 15
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 500
LDI r11, 69
LDI r12, 241
LDI r13, 13
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
