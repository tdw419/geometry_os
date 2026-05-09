; DESCRIPTION: Draws a green line from (396, 83) to (495, 167).
; PLAN: r0=396(x1), r1=83(y1), r2=495(x2), r3=167(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 83
LDI r2, 495
LDI r3, 167
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
