; DESCRIPTION: Composite: Renders a magenta line between points (307, 164) and (446, 190) then Draws a white rectangle at (111, 85) with width 15 and height 54.
; PLAN: r0=307(x1), r1=164(y1), r2=446(x2), r3=190(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=111(x), r6=85(y), r7=15(width), r8=54(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 307
LDI r1, 164
LDI r2, 446
LDI r3, 190
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 111
LDI r6, 85
LDI r7, 15
LDI r8, 54
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
