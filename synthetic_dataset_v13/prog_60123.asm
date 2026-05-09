; DESCRIPTION: Composite: Renders a magenta disk with center (454, 178) and radius 43 then Renders a green line between points (60, 224) and (288, 156) then Renders a black box of size 25x58 starting at (399, 14).
; PLAN: r0=454(x), r1=178(y), r2=43(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=60(x1), r6=224(y1), r7=288(x2), r8=156(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=399(x), r11=14(y), r12=25(width), r13=58(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 454
LDI r1, 178
LDI r2, 43
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 60
LDI r6, 224
LDI r7, 288
LDI r8, 156
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 399
LDI r11, 14
LDI r12, 25
LDI r13, 58
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
