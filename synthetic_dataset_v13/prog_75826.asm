; DESCRIPTION: Composite: Draws a yellow rectangle at (389, 188) with width 10 and height 55 then Places a green dot at position (374, 47) then Creates a white circular shape at (445, 96) with radius 46.
; PLAN: r0=389(x), r1=188(y), r2=10(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=374(x), r6=47(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=445(x), r11=96(y), r12=46(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 389
LDI r1, 188
LDI r2, 10
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 374
LDI r6, 47
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 445
LDI r11, 96
LDI r12, 46
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
