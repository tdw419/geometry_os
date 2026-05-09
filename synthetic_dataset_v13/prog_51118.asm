; DESCRIPTION: Composite: Renders a blue box of size 80x71 starting at (299, 76) then Renders a white disk with center (99, 169) and radius 41 then Places a green dot at position (194, 39).
; PLAN: r0=299(x), r1=76(y), r2=80(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=99(x), r6=169(y), r7=41(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=194(x), r11=39(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 299
LDI r1, 76
LDI r2, 80
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 99
LDI r6, 169
LDI r7, 41
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 194
LDI r11, 39
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
