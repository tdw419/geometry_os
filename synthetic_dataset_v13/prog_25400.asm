; DESCRIPTION: Composite: Creates a purple rectangular region at (258, 120) spanning 50 by 90 pixels then Sets a single cyan pixel at (336, 129) then Places a purple line segment connecting (180, 20) to (260, 251).
; PLAN: r0=258(x), r1=120(y), r2=50(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=336(x), r6=129(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=180(x1), r11=20(y1), r12=260(x2), r13=251(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 258
LDI r1, 120
LDI r2, 50
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 336
LDI r6, 129
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 180
LDI r11, 20
LDI r12, 260
LDI r13, 251
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
