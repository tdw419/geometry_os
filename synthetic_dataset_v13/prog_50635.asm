; DESCRIPTION: Composite: Renders a yellow box of size 37x35 starting at (475, 206) then Places a cyan dot at position (442, 95) then Places a purple circle of radius 55 at center (330, 70).
; PLAN: r0=475(x), r1=206(y), r2=37(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=442(x), r6=95(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=330(x), r11=70(y), r12=55(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 475
LDI r1, 206
LDI r2, 37
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 95
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 330
LDI r11, 70
LDI r12, 55
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
