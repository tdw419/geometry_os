; DESCRIPTION: Places a orange line segment connecting (307, 74) to (362, 138).
; PLAN: r0=307(x1), r1=74(y1), r2=362(x2), r3=138(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 74
LDI r2, 362
LDI r3, 138
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
