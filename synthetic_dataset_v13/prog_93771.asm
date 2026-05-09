; DESCRIPTION: Composite: Renders a magenta disk with center (46, 96) and radius 31 then Places a orange dot at position (4, 156) then Places a yellow line segment connecting (328, 146) to (291, 67).
; PLAN: r0=46(x), r1=96(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=4(x), r6=156(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=328(x1), r11=146(y1), r12=291(x2), r13=67(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 46
LDI r1, 96
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 4
LDI r6, 156
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 328
LDI r11, 146
LDI r12, 291
LDI r13, 67
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
