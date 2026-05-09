; DESCRIPTION: Draws a magenta line from (38, 170) to (171, 31).
; PLAN: r0=38(x1), r1=170(y1), r2=171(x2), r3=31(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 170
LDI r2, 171
LDI r3, 31
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
