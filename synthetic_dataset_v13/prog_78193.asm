; DESCRIPTION: Draws a green line from (76, 225) to (266, 3).
; PLAN: r0=76(x1), r1=225(y1), r2=266(x2), r3=3(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 225
LDI r2, 266
LDI r3, 3
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
