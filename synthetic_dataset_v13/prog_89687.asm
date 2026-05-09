; DESCRIPTION: Composite: Creates a magenta rectangular region at (41, 93) spanning 54 by 70 pixels then Draws a blue line from (120, 119) to (360, 49).
; PLAN: r0=41(x), r1=93(y), r2=54(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=120(x1), r6=119(y1), r7=360(x2), r8=49(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 41
LDI r1, 93
LDI r2, 54
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 120
LDI r6, 119
LDI r7, 360
LDI r8, 49
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
