; DESCRIPTION: Composite: Places a purple line segment connecting (170, 71) to (298, 240) then Creates a purple rectangular region at (281, 3) spanning 90 by 113 pixels then Sets a single green pixel at (154, 218).
; PLAN: r0=170(x1), r1=71(y1), r2=298(x2), r3=240(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=281(x), r6=3(y), r7=90(width), r8=113(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=154(x), r11=218(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 170
LDI r1, 71
LDI r2, 298
LDI r3, 240
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 3
LDI r7, 90
LDI r8, 113
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 154
LDI r11, 218
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
