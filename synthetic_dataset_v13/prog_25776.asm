; DESCRIPTION: Draws a white line from (131, 62) to (76, 225).
; PLAN: r0=131(x1), r1=62(y1), r2=76(x2), r3=225(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 62
LDI r2, 76
LDI r3, 225
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
