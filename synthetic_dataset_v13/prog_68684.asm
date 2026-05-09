; DESCRIPTION: Composite: Renders a purple box of size 66x59 starting at (271, 2) then Places a black circle of radius 64 at center (219, 190) then Renders a magenta line between points (291, 171) and (23, 74).
; PLAN: r0=271(x), r1=2(y), r2=66(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=219(x), r6=190(y), r7=64(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=291(x1), r11=171(y1), r12=23(x2), r13=74(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 271
LDI r1, 2
LDI r2, 66
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 219
LDI r6, 190
LDI r7, 64
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 291
LDI r11, 171
LDI r12, 23
LDI r13, 74
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
