; DESCRIPTION: Composite: Places a black line segment connecting (324, 39) to (129, 162) then Places a cyan circle of radius 32 at center (388, 219) then Renders a purple box of size 45x31 starting at (55, 182).
; PLAN: r0=324(x1), r1=39(y1), r2=129(x2), r3=162(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=388(x), r6=219(y), r7=32(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=55(x), r11=182(y), r12=45(width), r13=31(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 324
LDI r1, 39
LDI r2, 129
LDI r3, 162
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 219
LDI r7, 32
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 55
LDI r11, 182
LDI r12, 45
LDI r13, 31
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
