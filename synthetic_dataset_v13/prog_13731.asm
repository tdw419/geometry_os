; DESCRIPTION: Draws a green line from (12, 86) to (432, 225).
; PLAN: r0=12(x1), r1=86(y1), r2=432(x2), r3=225(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 86
LDI r2, 432
LDI r3, 225
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
