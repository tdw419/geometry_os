; DESCRIPTION: Draws a yellow line from (258, 29) to (193, 40).
; PLAN: r0=258(x1), r1=29(y1), r2=193(x2), r3=40(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 29
LDI r2, 193
LDI r3, 40
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
