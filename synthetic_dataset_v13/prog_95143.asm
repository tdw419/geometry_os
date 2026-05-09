; DESCRIPTION: Composite: Renders a blue box of size 22x65 starting at (236, 61) then Places a white dot at position (488, 175) then Places a purple circle of radius 37 at center (198, 38).
; PLAN: r0=236(x), r1=61(y), r2=22(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=488(x), r6=175(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=198(x), r11=38(y), r12=37(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 236
LDI r1, 61
LDI r2, 22
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 488
LDI r6, 175
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 198
LDI r11, 38
LDI r12, 37
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
