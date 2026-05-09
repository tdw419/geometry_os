; DESCRIPTION: Draws a blue line from (37, 40) to (168, 33).
; PLAN: r0=37(x1), r1=40(y1), r2=168(x2), r3=33(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 40
LDI r2, 168
LDI r3, 33
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
