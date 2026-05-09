; DESCRIPTION: Renders a orange line between points (401, 237) and (91, 112).
; PLAN: r0=401(x1), r1=237(y1), r2=91(x2), r3=112(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 237
LDI r2, 91
LDI r3, 112
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
