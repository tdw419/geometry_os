; DESCRIPTION: Draws a purple line from (406, 16) to (120, 162).
; PLAN: r0=406(x1), r1=16(y1), r2=120(x2), r3=162(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 16
LDI r2, 120
LDI r3, 162
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
