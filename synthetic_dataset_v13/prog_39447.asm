; DESCRIPTION: Composite: Renders a yellow box of size 54x107 starting at (311, 126) then Draws a red line from (19, 92) to (112, 100).
; PLAN: r0=311(x), r1=126(y), r2=54(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=19(x1), r6=92(y1), r7=112(x2), r8=100(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 311
LDI r1, 126
LDI r2, 54
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 19
LDI r6, 92
LDI r7, 112
LDI r8, 100
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
