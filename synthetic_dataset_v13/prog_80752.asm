; DESCRIPTION: Composite: Creates a cyan rectangular region at (18, 56) spanning 106 by 76 pixels then Sets a single purple pixel at (450, 185) then Places a black circle of radius 69 at center (298, 84).
; PLAN: r0=18(x), r1=56(y), r2=106(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=450(x), r6=185(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=298(x), r11=84(y), r12=69(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 18
LDI r1, 56
LDI r2, 106
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 450
LDI r6, 185
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 298
LDI r11, 84
LDI r12, 69
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
