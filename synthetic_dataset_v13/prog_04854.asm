; DESCRIPTION: Draws a blue line from (455, 42) to (352, 105).
; PLAN: r0=455(x1), r1=42(y1), r2=352(x2), r3=105(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 42
LDI r2, 352
LDI r3, 105
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
