; DESCRIPTION: Draws a green line from (161, 223) to (39, 204).
; PLAN: r0=161(x1), r1=223(y1), r2=39(x2), r3=204(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 223
LDI r2, 39
LDI r3, 204
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
