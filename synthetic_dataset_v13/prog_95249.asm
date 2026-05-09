; DESCRIPTION: Draws a blue line from (329, 57) to (494, 7).
; PLAN: r0=329(x1), r1=57(y1), r2=494(x2), r3=7(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 57
LDI r2, 494
LDI r3, 7
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
