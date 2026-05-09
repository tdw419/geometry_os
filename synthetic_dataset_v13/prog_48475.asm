; DESCRIPTION: Composite: Draws a green line from (137, 155) to (217, 130) then Draws a cyan circle centered at (151, 167) with radius 61 then Renders a magenta box of size 109x55 starting at (118, 128).
; PLAN: r0=137(x1), r1=155(y1), r2=217(x2), r3=130(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=151(x), r6=167(y), r7=61(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=118(x), r11=128(y), r12=109(width), r13=55(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 137
LDI r1, 155
LDI r2, 217
LDI r3, 130
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 167
LDI r7, 61
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 118
LDI r11, 128
LDI r12, 109
LDI r13, 55
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
