; DESCRIPTION: Composite: Places a purple line segment connecting (193, 92) to (220, 21) then Creates a black rectangular region at (208, 78) spanning 94 by 109 pixels.
; PLAN: r0=193(x1), r1=92(y1), r2=220(x2), r3=21(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=208(x), r6=78(y), r7=94(width), r8=109(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 193
LDI r1, 92
LDI r2, 220
LDI r3, 21
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 208
LDI r6, 78
LDI r7, 94
LDI r8, 109
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
