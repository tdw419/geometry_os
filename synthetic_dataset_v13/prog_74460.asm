; DESCRIPTION: Composite: Places a red 51x10 rectangle at position (28, 200) then Renders a yellow line between points (476, 55) and (106, 8).
; PLAN: r0=28(x), r1=200(y), r2=51(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=476(x1), r6=55(y1), r7=106(x2), r8=8(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 28
LDI r1, 200
LDI r2, 51
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 476
LDI r6, 55
LDI r7, 106
LDI r8, 8
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
