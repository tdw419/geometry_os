; DESCRIPTION: Composite: Places a black circle of radius 45 at center (66, 69) then Renders a blue box of size 24x47 starting at (451, 75) then Sets a single green pixel at (234, 35).
; PLAN: r0=66(x), r1=69(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=451(x), r6=75(y), r7=24(width), r8=47(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=234(x), r11=35(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 66
LDI r1, 69
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 451
LDI r6, 75
LDI r7, 24
LDI r8, 47
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 234
LDI r11, 35
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
