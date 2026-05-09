; DESCRIPTION: Draws a red line from (476, 130) to (75, 8).
; PLAN: r0=476(x1), r1=130(y1), r2=75(x2), r3=8(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 130
LDI r2, 75
LDI r3, 8
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
