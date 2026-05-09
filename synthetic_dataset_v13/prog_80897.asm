; DESCRIPTION: Draws a blue line from (434, 85) to (465, 52).
; PLAN: r0=434(x1), r1=85(y1), r2=465(x2), r3=52(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 85
LDI r2, 465
LDI r3, 52
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
