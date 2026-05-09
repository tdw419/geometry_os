; DESCRIPTION: Draws a green line from (327, 187) to (355, 140).
; PLAN: r0=327(x1), r1=187(y1), r2=355(x2), r3=140(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 187
LDI r2, 355
LDI r3, 140
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
