; DESCRIPTION: Composite: Places a yellow line segment connecting (423, 30) to (377, 134) then Creates a black rectangular region at (455, 83) spanning 24 by 80 pixels then Sets a single cyan pixel at (507, 164).
; PLAN: r0=423(x1), r1=30(y1), r2=377(x2), r3=134(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=455(x), r6=83(y), r7=24(width), r8=80(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=507(x), r11=164(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 423
LDI r1, 30
LDI r2, 377
LDI r3, 134
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 455
LDI r6, 83
LDI r7, 24
LDI r8, 80
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 507
LDI r11, 164
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
