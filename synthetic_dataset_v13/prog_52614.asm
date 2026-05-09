; DESCRIPTION: Places a green line segment connecting (362, 133) to (8, 213).
; PLAN: r0=362(x1), r1=133(y1), r2=8(x2), r3=213(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 133
LDI r2, 8
LDI r3, 213
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
