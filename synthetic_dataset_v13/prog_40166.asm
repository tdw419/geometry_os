; DESCRIPTION: Composite: Renders a purple line between points (389, 129) and (53, 125) then Creates a red rectangular region at (356, 198) spanning 102 by 51 pixels.
; PLAN: r0=389(x1), r1=129(y1), r2=53(x2), r3=125(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=356(x), r6=198(y), r7=102(width), r8=51(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 389
LDI r1, 129
LDI r2, 53
LDI r3, 125
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 356
LDI r6, 198
LDI r7, 102
LDI r8, 51
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
