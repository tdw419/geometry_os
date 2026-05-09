; DESCRIPTION: Draws a white line from (359, 84) to (333, 241).
; PLAN: r0=359(x1), r1=84(y1), r2=333(x2), r3=241(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 84
LDI r2, 333
LDI r3, 241
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
