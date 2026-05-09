; DESCRIPTION: Composite: Creates a blue rectangular region at (190, 54) spanning 88 by 78 pixels then Draws a black line from (333, 131) to (492, 82) then Places a purple dot at position (308, 134).
; PLAN: r0=190(x), r1=54(y), r2=88(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=333(x1), r6=131(y1), r7=492(x2), r8=82(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=308(x), r11=134(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 190
LDI r1, 54
LDI r2, 88
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 333
LDI r6, 131
LDI r7, 492
LDI r8, 82
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 308
LDI r11, 134
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
