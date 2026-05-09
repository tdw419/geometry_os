; DESCRIPTION: Composite: Renders a black box of size 88x70 starting at (46, 5) then Sets a single white pixel at (230, 29) then Renders a cyan disk with center (220, 222) and radius 14.
; PLAN: r0=46(x), r1=5(y), r2=88(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=230(x), r6=29(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=220(x), r11=222(y), r12=14(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 46
LDI r1, 5
LDI r2, 88
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 29
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 220
LDI r11, 222
LDI r12, 14
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
