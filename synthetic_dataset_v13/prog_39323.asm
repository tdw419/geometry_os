; DESCRIPTION: Composite: Places a green line segment connecting (42, 101) to (401, 61) then Places a cyan circle of radius 32 at center (67, 188) then Renders a blue box of size 53x84 starting at (80, 142).
; PLAN: r0=42(x1), r1=101(y1), r2=401(x2), r3=61(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=67(x), r6=188(y), r7=32(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=80(x), r11=142(y), r12=53(width), r13=84(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 42
LDI r1, 101
LDI r2, 401
LDI r3, 61
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 67
LDI r6, 188
LDI r7, 32
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 80
LDI r11, 142
LDI r12, 53
LDI r13, 84
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
