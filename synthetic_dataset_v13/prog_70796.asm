; DESCRIPTION: Composite: Draws a magenta line from (194, 93) to (473, 124) then Renders a black box of size 106x75 starting at (389, 77).
; PLAN: r0=194(x1), r1=93(y1), r2=473(x2), r3=124(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=389(x), r6=77(y), r7=106(width), r8=75(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 194
LDI r1, 93
LDI r2, 473
LDI r3, 124
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 389
LDI r6, 77
LDI r7, 106
LDI r8, 75
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
