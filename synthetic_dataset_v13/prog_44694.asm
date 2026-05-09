; DESCRIPTION: Draws a yellow line from (356, 194) to (69, 220).
; PLAN: r0=356(x1), r1=194(y1), r2=69(x2), r3=220(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 194
LDI r2, 69
LDI r3, 220
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
