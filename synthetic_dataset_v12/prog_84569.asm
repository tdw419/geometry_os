; DESCRIPTION: Draws a magenta line from (76, 221) to (409, 9).
; PLAN: r0=76(x1), r1=221(y1), r2=409(x2), r3=9(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 221
LDI r2, 409
LDI r3, 9
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
