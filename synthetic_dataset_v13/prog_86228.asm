; DESCRIPTION: Composite: Renders a purple disk with center (409, 80) and radius 53 then Draws a black rectangle at (251, 150) with width 29 and height 74 then Places a cyan dot at position (442, 55).
; PLAN: r0=409(x), r1=80(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=251(x), r6=150(y), r7=29(width), r8=74(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=442(x), r11=55(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 409
LDI r1, 80
LDI r2, 53
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 251
LDI r6, 150
LDI r7, 29
LDI r8, 74
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 442
LDI r11, 55
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
