; DESCRIPTION: Composite: Places a red 95x45 rectangle at position (184, 81) then Renders a blue line between points (15, 238) and (500, 118).
; PLAN: r0=184(x), r1=81(y), r2=95(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=15(x1), r6=238(y1), r7=500(x2), r8=118(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 184
LDI r1, 81
LDI r2, 95
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 15
LDI r6, 238
LDI r7, 500
LDI r8, 118
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
