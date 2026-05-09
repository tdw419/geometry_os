; DESCRIPTION: Composite: Renders a blue box of size 68x18 starting at (371, 222) then Renders a green disk with center (17, 67) and radius 10 then Sets a single red pixel at (168, 197).
; PLAN: r0=371(x), r1=222(y), r2=68(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=17(x), r6=67(y), r7=10(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=168(x), r11=197(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 371
LDI r1, 222
LDI r2, 68
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 17
LDI r6, 67
LDI r7, 10
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 168
LDI r11, 197
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
