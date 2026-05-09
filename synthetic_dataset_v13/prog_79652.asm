; DESCRIPTION: Composite: Draws a cyan line from (392, 92) to (442, 77) then Creates a green rectangular region at (159, 36) spanning 84 by 94 pixels then Places a purple dot at position (3, 120).
; PLAN: r0=392(x1), r1=92(y1), r2=442(x2), r3=77(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=159(x), r6=36(y), r7=84(width), r8=94(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=3(x), r11=120(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 392
LDI r1, 92
LDI r2, 442
LDI r3, 77
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 159
LDI r6, 36
LDI r7, 84
LDI r8, 94
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 3
LDI r11, 120
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
