; DESCRIPTION: Places a green line segment connecting (428, 245) to (263, 65).
; PLAN: r0=428(x1), r1=245(y1), r2=263(x2), r3=65(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 245
LDI r2, 263
LDI r3, 65
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
