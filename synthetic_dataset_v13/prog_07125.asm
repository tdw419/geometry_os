; DESCRIPTION: Composite: Renders a blue box of size 95x84 starting at (11, 41) then Renders a blue disk with center (381, 191) and radius 50 then Places a blue dot at position (127, 40).
; PLAN: r0=11(x), r1=41(y), r2=95(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=381(x), r6=191(y), r7=50(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=127(x), r11=40(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 11
LDI r1, 41
LDI r2, 95
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 381
LDI r6, 191
LDI r7, 50
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 127
LDI r11, 40
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
