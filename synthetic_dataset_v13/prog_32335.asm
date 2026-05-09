; DESCRIPTION: Composite: Renders a cyan box of size 35x24 starting at (398, 171) then Places a cyan dot at position (272, 76) then Places a blue circle of radius 55 at center (178, 147).
; PLAN: r0=398(x), r1=171(y), r2=35(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=272(x), r6=76(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=178(x), r11=147(y), r12=55(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 398
LDI r1, 171
LDI r2, 35
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 272
LDI r6, 76
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 178
LDI r11, 147
LDI r12, 55
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
