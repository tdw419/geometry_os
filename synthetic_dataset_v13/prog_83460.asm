; DESCRIPTION: Draws a yellow line from (193, 49) to (108, 87).
; PLAN: r0=193(x1), r1=49(y1), r2=108(x2), r3=87(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 49
LDI r2, 108
LDI r3, 87
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
