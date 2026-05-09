; DESCRIPTION: Renders a red line between points (291, 240) and (361, 152).
; PLAN: r0=291(x1), r1=240(y1), r2=361(x2), r3=152(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 240
LDI r2, 361
LDI r3, 152
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
