; DESCRIPTION: Composite: Renders a green box of size 69x58 starting at (300, 48) then Places a green circle of radius 34 at center (371, 71) then Sets a single yellow pixel at (110, 83).
; PLAN: r0=300(x), r1=48(y), r2=69(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=371(x), r6=71(y), r7=34(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=110(x), r11=83(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 300
LDI r1, 48
LDI r2, 69
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 371
LDI r6, 71
LDI r7, 34
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 110
LDI r11, 83
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
