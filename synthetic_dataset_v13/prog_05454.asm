; DESCRIPTION: Draws a blue line from (418, 10) to (504, 73).
; PLAN: r0=418(x1), r1=10(y1), r2=504(x2), r3=73(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 10
LDI r2, 504
LDI r3, 73
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
