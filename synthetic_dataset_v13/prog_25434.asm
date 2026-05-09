; DESCRIPTION: Draws a green line from (58, 77) to (337, 18).
; PLAN: r0=58(x1), r1=77(y1), r2=337(x2), r3=18(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 77
LDI r2, 337
LDI r3, 18
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
