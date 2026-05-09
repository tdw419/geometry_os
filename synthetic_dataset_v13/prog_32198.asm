; DESCRIPTION: Composite: Places a green line segment connecting (269, 108) to (136, 128) then Places a magenta circle of radius 20 at center (120, 140) then Places a yellow 75x67 rectangle at position (7, 140).
; PLAN: r0=269(x1), r1=108(y1), r2=136(x2), r3=128(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=120(x), r6=140(y), r7=20(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=7(x), r11=140(y), r12=75(width), r13=67(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 269
LDI r1, 108
LDI r2, 136
LDI r3, 128
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 120
LDI r6, 140
LDI r7, 20
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 7
LDI r11, 140
LDI r12, 75
LDI r13, 67
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
