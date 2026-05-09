; DESCRIPTION: Draws a purple line from (168, 238) to (91, 107).
; PLAN: r0=168(x1), r1=238(y1), r2=91(x2), r3=107(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 238
LDI r2, 91
LDI r3, 107
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
