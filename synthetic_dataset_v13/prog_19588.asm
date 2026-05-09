; DESCRIPTION: Places a blue line segment connecting (311, 111) to (367, 107).
; PLAN: r0=311(x1), r1=111(y1), r2=367(x2), r3=107(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 111
LDI r2, 367
LDI r3, 107
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
