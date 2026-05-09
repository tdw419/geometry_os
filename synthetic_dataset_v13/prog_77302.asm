; DESCRIPTION: Composite: Renders a white box of size 36x61 starting at (369, 118) then Draws a purple line from (200, 84) to (335, 216) then Sets a single cyan pixel at (263, 18).
; PLAN: r0=369(x), r1=118(y), r2=36(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=200(x1), r6=84(y1), r7=335(x2), r8=216(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=263(x), r11=18(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 369
LDI r1, 118
LDI r2, 36
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 84
LDI r7, 335
LDI r8, 216
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 263
LDI r11, 18
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
