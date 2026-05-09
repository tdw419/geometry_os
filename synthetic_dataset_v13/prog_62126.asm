; DESCRIPTION: Places a yellow line segment connecting (392, 53) to (465, 232).
; PLAN: r0=392(x1), r1=53(y1), r2=465(x2), r3=232(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 53
LDI r2, 465
LDI r3, 232
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
