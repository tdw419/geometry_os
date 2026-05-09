; DESCRIPTION: Composite: Renders a cyan box of size 118x117 starting at (280, 92) then Renders a blue line between points (162, 164) and (244, 130).
; PLAN: r0=280(x), r1=92(y), r2=118(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=162(x1), r6=164(y1), r7=244(x2), r8=130(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 280
LDI r1, 92
LDI r2, 118
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 162
LDI r6, 164
LDI r7, 244
LDI r8, 130
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
