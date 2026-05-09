; DESCRIPTION: Draws a green line from (146, 170) to (188, 138).
; PLAN: r0=146(x1), r1=170(y1), r2=188(x2), r3=138(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 170
LDI r2, 188
LDI r3, 138
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
