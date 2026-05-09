; DESCRIPTION: Composite: Renders a black box of size 20x114 starting at (3, 64) then Places a blue dot at position (298, 29) then Places a black circle of radius 56 at center (371, 120).
; PLAN: r0=3(x), r1=64(y), r2=20(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=298(x), r6=29(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=371(x), r11=120(y), r12=56(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 3
LDI r1, 64
LDI r2, 20
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 298
LDI r6, 29
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 371
LDI r11, 120
LDI r12, 56
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
