; DESCRIPTION: Draws a blue line from (236, 215) to (258, 69).
; PLAN: r0=236(x1), r1=215(y1), r2=258(x2), r3=69(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 215
LDI r2, 258
LDI r3, 69
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
