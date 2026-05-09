; DESCRIPTION: Places a yellow line segment connecting (428, 242) to (433, 195).
; PLAN: r0=428(x1), r1=242(y1), r2=433(x2), r3=195(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 242
LDI r2, 433
LDI r3, 195
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
