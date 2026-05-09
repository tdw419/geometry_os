; DESCRIPTION: Draws a blue line from (103, 185) to (465, 30).
; PLAN: r0=103(x1), r1=185(y1), r2=465(x2), r3=30(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 185
LDI r2, 465
LDI r3, 30
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
