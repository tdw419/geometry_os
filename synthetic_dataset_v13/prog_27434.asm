; DESCRIPTION: Composite: Draws a cyan circle centered at (360, 79) with radius 67 then Renders a magenta line between points (216, 29) and (158, 194).
; PLAN: r0=360(x), r1=79(y), r2=67(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=216(x1), r6=29(y1), r7=158(x2), r8=194(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 360
LDI r1, 79
LDI r2, 67
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 216
LDI r6, 29
LDI r7, 158
LDI r8, 194
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
