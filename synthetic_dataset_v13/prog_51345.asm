; DESCRIPTION: Composite: Draws a blue line from (471, 42) to (36, 71) then Creates a blue rectangular region at (63, 126) spanning 62 by 74 pixels then Places a red dot at position (327, 187).
; PLAN: r0=471(x1), r1=42(y1), r2=36(x2), r3=71(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=63(x), r6=126(y), r7=62(width), r8=74(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=327(x), r11=187(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 471
LDI r1, 42
LDI r2, 36
LDI r3, 71
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 63
LDI r6, 126
LDI r7, 62
LDI r8, 74
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 327
LDI r11, 187
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
