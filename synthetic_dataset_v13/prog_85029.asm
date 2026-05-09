; DESCRIPTION: Draws a yellow line from (69, 254) to (455, 7).
; PLAN: r0=69(x1), r1=254(y1), r2=455(x2), r3=7(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 254
LDI r2, 455
LDI r3, 7
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
