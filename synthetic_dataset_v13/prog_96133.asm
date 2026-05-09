; DESCRIPTION: Renders a orange line between points (401, 202) and (254, 65).
; PLAN: r0=401(x1), r1=202(y1), r2=254(x2), r3=65(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 202
LDI r2, 254
LDI r3, 65
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
