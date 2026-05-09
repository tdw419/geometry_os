; DESCRIPTION: Composite: Renders a yellow box of size 49x57 starting at (10, 123) then Draws a magenta circle centered at (297, 64) with radius 16 then Places a cyan line segment connecting (143, 223) to (172, 234).
; PLAN: r0=10(x), r1=123(y), r2=49(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=297(x), r6=64(y), r7=16(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=143(x1), r11=223(y1), r12=172(x2), r13=234(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 10
LDI r1, 123
LDI r2, 49
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 64
LDI r7, 16
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 143
LDI r11, 223
LDI r12, 172
LDI r13, 234
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
