; DESCRIPTION: Places a green line segment connecting (362, 159) to (70, 230).
; PLAN: r0=362(x1), r1=159(y1), r2=70(x2), r3=230(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 159
LDI r2, 70
LDI r3, 230
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
