; DESCRIPTION: Draws a green line from (152, 153) to (366, 161).
; PLAN: r0=152(x1), r1=153(y1), r2=366(x2), r3=161(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 153
LDI r2, 366
LDI r3, 161
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
