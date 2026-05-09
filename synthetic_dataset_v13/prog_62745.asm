; DESCRIPTION: Composite: Renders a blue box of size 48x29 starting at (171, 24) then Places a magenta circle of radius 31 at center (73, 140) then Sets a single green pixel at (238, 123).
; PLAN: r0=171(x), r1=24(y), r2=48(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=73(x), r6=140(y), r7=31(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=238(x), r11=123(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 171
LDI r1, 24
LDI r2, 48
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 73
LDI r6, 140
LDI r7, 31
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 238
LDI r11, 123
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
