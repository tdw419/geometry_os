; DESCRIPTION: Draws a yellow line from (401, 164) to (99, 214).
; PLAN: r0=401(x1), r1=164(y1), r2=99(x2), r3=214(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 164
LDI r2, 99
LDI r3, 214
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
