; DESCRIPTION: Draws a orange line from (216, 204) to (401, 125).
; PLAN: r0=216(x1), r1=204(y1), r2=401(x2), r3=125(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 204
LDI r2, 401
LDI r3, 125
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
