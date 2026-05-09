; DESCRIPTION: Renders a orange line between points (423, 219) and (401, 166).
; PLAN: r0=423(x1), r1=219(y1), r2=401(x2), r3=166(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 219
LDI r2, 401
LDI r3, 166
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
