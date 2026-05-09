; DESCRIPTION: Places a black line segment connecting (345, 58) to (493, 231).
; PLAN: r0=345(x1), r1=58(y1), r2=493(x2), r3=231(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 58
LDI r2, 493
LDI r3, 231
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
