; DESCRIPTION: Draws a green line from (494, 145) to (357, 225).
; PLAN: r0=494(x1), r1=145(y1), r2=357(x2), r3=225(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 145
LDI r2, 357
LDI r3, 225
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
