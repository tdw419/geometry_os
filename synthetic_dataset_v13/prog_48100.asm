; DESCRIPTION: Renders a red line between points (254, 214) and (426, 49).
; PLAN: r0=254(x1), r1=214(y1), r2=426(x2), r3=49(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 214
LDI r2, 426
LDI r3, 49
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
