; DESCRIPTION: Draws a blue line from (465, 213) to (371, 206).
; PLAN: r0=465(x1), r1=213(y1), r2=371(x2), r3=206(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 213
LDI r2, 371
LDI r3, 206
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
