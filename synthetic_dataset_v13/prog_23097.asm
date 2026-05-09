; DESCRIPTION: Draws a white line from (76, 151) to (494, 212).
; PLAN: r0=76(x1), r1=151(y1), r2=494(x2), r3=212(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 151
LDI r2, 494
LDI r3, 212
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
