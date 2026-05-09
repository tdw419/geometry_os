; DESCRIPTION: Renders a orange line between points (167, 210) and (440, 49).
; PLAN: r0=167(x1), r1=210(y1), r2=440(x2), r3=49(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 210
LDI r2, 440
LDI r3, 49
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
