; DESCRIPTION: Draws a blue line from (307, 180) to (497, 187).
; PLAN: r0=307(x1), r1=180(y1), r2=497(x2), r3=187(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 180
LDI r2, 497
LDI r3, 187
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
