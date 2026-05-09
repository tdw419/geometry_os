; DESCRIPTION: Draws a red line from (401, 105) to (134, 57).
; PLAN: r0=401(x1), r1=105(y1), r2=134(x2), r3=57(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 105
LDI r2, 134
LDI r3, 57
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
