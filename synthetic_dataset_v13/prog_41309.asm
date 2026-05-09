; DESCRIPTION: Renders a red line between points (43, 124) and (476, 210).
; PLAN: r0=43(x1), r1=124(y1), r2=476(x2), r3=210(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 124
LDI r2, 476
LDI r3, 210
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
