; DESCRIPTION: Draws a blue line from (402, 23) to (508, 210).
; PLAN: r0=402(x1), r1=23(y1), r2=508(x2), r3=210(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 23
LDI r2, 508
LDI r3, 210
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
