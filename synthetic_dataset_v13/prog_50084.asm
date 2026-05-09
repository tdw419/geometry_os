; DESCRIPTION: Places a green line segment connecting (468, 204) to (362, 231).
; PLAN: r0=468(x1), r1=204(y1), r2=362(x2), r3=231(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 204
LDI r2, 362
LDI r3, 231
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
