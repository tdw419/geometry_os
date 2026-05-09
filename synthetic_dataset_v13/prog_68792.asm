; DESCRIPTION: Draws a yellow line from (313, 208) to (229, 161).
; PLAN: r0=313(x1), r1=208(y1), r2=229(x2), r3=161(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 208
LDI r2, 229
LDI r3, 161
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
