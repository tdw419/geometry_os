; DESCRIPTION: Places a green line segment connecting (362, 16) to (501, 60).
; PLAN: r0=362(x1), r1=16(y1), r2=501(x2), r3=60(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 16
LDI r2, 501
LDI r3, 60
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
