; DESCRIPTION: Draws a green line from (22, 25) to (401, 123).
; PLAN: r0=22(x1), r1=25(y1), r2=401(x2), r3=123(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 25
LDI r2, 401
LDI r3, 123
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
