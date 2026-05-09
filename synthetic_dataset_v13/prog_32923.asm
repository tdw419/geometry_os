; DESCRIPTION: Composite: Draws a blue rectangle at (256, 47) with width 25 and height 76 then Places a blue dot at position (339, 91) then Places a white circle of radius 50 at center (295, 126).
; PLAN: r0=256(x), r1=47(y), r2=25(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=339(x), r6=91(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=295(x), r11=126(y), r12=50(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 256
LDI r1, 47
LDI r2, 25
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 339
LDI r6, 91
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 295
LDI r11, 126
LDI r12, 50
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
