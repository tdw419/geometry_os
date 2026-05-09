; DESCRIPTION: Composite: Draws a white rectangle at (146, 126) with width 76 and height 60 then Renders a magenta line between points (49, 216) and (190, 153).
; PLAN: r0=146(x), r1=126(y), r2=76(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=49(x1), r6=216(y1), r7=190(x2), r8=153(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 146
LDI r1, 126
LDI r2, 76
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 49
LDI r6, 216
LDI r7, 190
LDI r8, 153
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
