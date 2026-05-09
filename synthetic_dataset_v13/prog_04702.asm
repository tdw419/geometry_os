; DESCRIPTION: Composite: Draws a red rectangle at (214, 60) with width 100 and height 93 then Renders a yellow line between points (89, 146) and (142, 95).
; PLAN: r0=214(x), r1=60(y), r2=100(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=89(x1), r6=146(y1), r7=142(x2), r8=95(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 214
LDI r1, 60
LDI r2, 100
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 89
LDI r6, 146
LDI r7, 142
LDI r8, 95
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
