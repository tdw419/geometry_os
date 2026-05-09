; DESCRIPTION: Places a yellow line segment connecting (164, 51) to (59, 107).
; PLAN: r0=164(x1), r1=51(y1), r2=59(x2), r3=107(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 51
LDI r2, 59
LDI r3, 107
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
