; DESCRIPTION: Composite: Places a black 108x88 rectangle at position (26, 20) then Renders a black line between points (203, 242) and (383, 13) then Sets a single white pixel at (15, 110).
; PLAN: r0=26(x), r1=20(y), r2=108(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=203(x1), r6=242(y1), r7=383(x2), r8=13(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=15(x), r11=110(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 26
LDI r1, 20
LDI r2, 108
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 203
LDI r6, 242
LDI r7, 383
LDI r8, 13
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 15
LDI r11, 110
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
