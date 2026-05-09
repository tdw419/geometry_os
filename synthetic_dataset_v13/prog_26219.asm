; DESCRIPTION: Composite: Renders a red box of size 23x12 starting at (111, 113) then Draws a magenta line from (12, 38) to (319, 216).
; PLAN: r0=111(x), r1=113(y), r2=23(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=12(x1), r6=38(y1), r7=319(x2), r8=216(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 111
LDI r1, 113
LDI r2, 23
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 12
LDI r6, 38
LDI r7, 319
LDI r8, 216
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
