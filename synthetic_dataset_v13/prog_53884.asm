; DESCRIPTION: Composite: Renders a purple box of size 88x64 starting at (418, 98) then Places a black dot at position (108, 203) then Renders a green disk with center (286, 220) and radius 36.
; PLAN: r0=418(x), r1=98(y), r2=88(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=108(x), r6=203(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=286(x), r11=220(y), r12=36(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 418
LDI r1, 98
LDI r2, 88
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 108
LDI r6, 203
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 286
LDI r11, 220
LDI r12, 36
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
