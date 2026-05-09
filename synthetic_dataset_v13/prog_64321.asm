; DESCRIPTION: Draws a purple line from (387, 120) to (504, 157).
; PLAN: r0=387(x1), r1=120(y1), r2=504(x2), r3=157(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 120
LDI r2, 504
LDI r3, 157
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
