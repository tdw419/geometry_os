; DESCRIPTION: Composite: Places a orange circle of radius 51 at center (349, 110) then Renders a black box of size 54x78 starting at (371, 83) then Places a black dot at position (367, 82).
; PLAN: r0=349(x), r1=110(y), r2=51(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=371(x), r6=83(y), r7=54(width), r8=78(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=367(x), r11=82(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 349
LDI r1, 110
LDI r2, 51
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 371
LDI r6, 83
LDI r7, 54
LDI r8, 78
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 367
LDI r11, 82
LDI r12, 0x000000
PSET r10, r11, r12
HALT
