; DESCRIPTION: Composite: Draws a red line from (81, 206) to (47, 184) then Draws a black rectangle at (42, 202) with width 22 and height 21 then Sets a single yellow pixel at (102, 68).
; PLAN: r0=81(x1), r1=206(y1), r2=47(x2), r3=184(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=42(x), r6=202(y), r7=22(width), r8=21(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=102(x), r11=68(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 81
LDI r1, 206
LDI r2, 47
LDI r3, 184
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 42
LDI r6, 202
LDI r7, 22
LDI r8, 21
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 102
LDI r11, 68
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
