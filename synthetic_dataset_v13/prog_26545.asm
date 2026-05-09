; DESCRIPTION: Draws a green line from (494, 9) to (385, 162).
; PLAN: r0=494(x1), r1=9(y1), r2=385(x2), r3=162(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 9
LDI r2, 385
LDI r3, 162
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
