; DESCRIPTION: Composite: Renders a black box of size 42x21 starting at (168, 232) then Draws a white circle centered at (51, 100) with radius 45 then Draws a yellow line from (112, 207) to (77, 18).
; PLAN: r0=168(x), r1=232(y), r2=42(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=51(x), r6=100(y), r7=45(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=112(x1), r11=207(y1), r12=77(x2), r13=18(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 168
LDI r1, 232
LDI r2, 42
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 51
LDI r6, 100
LDI r7, 45
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 112
LDI r11, 207
LDI r12, 77
LDI r13, 18
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
