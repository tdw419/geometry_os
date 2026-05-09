; DESCRIPTION: Composite: Creates a purple rectangular region at (3, 20) spanning 52 by 51 pixels then Renders a red line between points (240, 209) and (142, 23).
; PLAN: r0=3(x), r1=20(y), r2=52(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=240(x1), r6=209(y1), r7=142(x2), r8=23(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 3
LDI r1, 20
LDI r2, 52
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 209
LDI r7, 142
LDI r8, 23
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
