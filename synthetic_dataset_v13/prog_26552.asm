; DESCRIPTION: Places a purple line segment connecting (241, 33) to (392, 166).
; PLAN: r0=241(x1), r1=33(y1), r2=392(x2), r3=166(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 33
LDI r2, 392
LDI r3, 166
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
