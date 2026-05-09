; DESCRIPTION: Composite: Places a cyan line segment connecting (62, 112) to (158, 96) then Places a red dot at position (5, 47) then Places a red 20x51 rectangle at position (200, 186).
; PLAN: r0=62(x1), r1=112(y1), r2=158(x2), r3=96(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=5(x), r6=47(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=200(x), r11=186(y), r12=20(width), r13=51(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 62
LDI r1, 112
LDI r2, 158
LDI r3, 96
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 5
LDI r6, 47
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 200
LDI r11, 186
LDI r12, 20
LDI r13, 51
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
