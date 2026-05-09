; DESCRIPTION: Composite: Draws a magenta line from (118, 238) to (180, 205) then Creates a blue rectangular region at (94, 124) spanning 120 by 113 pixels then Places a black dot at position (14, 200).
; PLAN: r0=118(x1), r1=238(y1), r2=180(x2), r3=205(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=94(x), r6=124(y), r7=120(width), r8=113(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=14(x), r11=200(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 118
LDI r1, 238
LDI r2, 180
LDI r3, 205
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 94
LDI r6, 124
LDI r7, 120
LDI r8, 113
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 14
LDI r11, 200
LDI r12, 0x000000
PSET r10, r11, r12
HALT
