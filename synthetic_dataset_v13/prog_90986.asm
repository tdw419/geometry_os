; DESCRIPTION: Draws a purple line from (387, 16) to (454, 28).
; PLAN: r0=387(x1), r1=16(y1), r2=454(x2), r3=28(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 16
LDI r2, 454
LDI r3, 28
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
