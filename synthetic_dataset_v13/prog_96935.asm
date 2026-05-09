; DESCRIPTION: Renders a orange line between points (108, 253) and (488, 85).
; PLAN: r0=108(x1), r1=253(y1), r2=488(x2), r3=85(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 253
LDI r2, 488
LDI r3, 85
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
