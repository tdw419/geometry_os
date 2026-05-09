; DESCRIPTION: Draws a green line from (123, 47) to (401, 4).
; PLAN: r0=123(x1), r1=47(y1), r2=401(x2), r3=4(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 47
LDI r2, 401
LDI r3, 4
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
