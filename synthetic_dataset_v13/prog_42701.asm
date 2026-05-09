; DESCRIPTION: Composite: Creates a blue rectangular region at (190, 4) spanning 94 by 54 pixels then Places a green line segment connecting (380, 186) to (69, 72) then Sets a single yellow pixel at (359, 161).
; PLAN: r0=190(x), r1=4(y), r2=94(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=380(x1), r6=186(y1), r7=69(x2), r8=72(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=359(x), r11=161(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 190
LDI r1, 4
LDI r2, 94
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 380
LDI r6, 186
LDI r7, 69
LDI r8, 72
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 359
LDI r11, 161
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
