; DESCRIPTION: Draws a green line from (455, 69) to (307, 78).
; PLAN: r0=455(x1), r1=69(y1), r2=307(x2), r3=78(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 69
LDI r2, 307
LDI r3, 78
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
