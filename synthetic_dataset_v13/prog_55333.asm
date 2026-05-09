; DESCRIPTION: Composite: Renders a black box of size 50x73 starting at (78, 96) then Places a blue circle of radius 64 at center (389, 111) then Places a white dot at position (406, 234).
; PLAN: r0=78(x), r1=96(y), r2=50(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=389(x), r6=111(y), r7=64(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=406(x), r11=234(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 78
LDI r1, 96
LDI r2, 50
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 389
LDI r6, 111
LDI r7, 64
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 406
LDI r11, 234
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
