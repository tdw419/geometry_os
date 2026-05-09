; DESCRIPTION: Composite: Draws a yellow rectangle at (157, 124) with width 110 and height 73 then Draws a white line from (86, 212) to (97, 62) then Sets a single magenta pixel at (159, 192).
; PLAN: r0=157(x), r1=124(y), r2=110(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=86(x1), r6=212(y1), r7=97(x2), r8=62(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=159(x), r11=192(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 157
LDI r1, 124
LDI r2, 110
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 212
LDI r7, 97
LDI r8, 62
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 159
LDI r11, 192
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
