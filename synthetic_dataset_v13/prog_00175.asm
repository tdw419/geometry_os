; DESCRIPTION: Draws a green line from (29, 187) to (110, 146).
; PLAN: r0=29(x1), r1=187(y1), r2=110(x2), r3=146(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 187
LDI r2, 110
LDI r3, 146
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
