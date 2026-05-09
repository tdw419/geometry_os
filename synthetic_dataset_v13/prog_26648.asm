; DESCRIPTION: Renders a orange line between points (401, 138) and (419, 146).
; PLAN: r0=401(x1), r1=138(y1), r2=419(x2), r3=146(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 138
LDI r2, 419
LDI r3, 146
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
