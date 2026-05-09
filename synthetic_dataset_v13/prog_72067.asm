; DESCRIPTION: Composite: Renders a purple box of size 85x70 starting at (188, 178) then Places a cyan dot at position (410, 110) then Draws a white circle centered at (55, 58) with radius 11.
; PLAN: r0=188(x), r1=178(y), r2=85(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=410(x), r6=110(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=55(x), r11=58(y), r12=11(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 188
LDI r1, 178
LDI r2, 85
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 410
LDI r6, 110
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 55
LDI r11, 58
LDI r12, 11
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
