; DESCRIPTION: Draws a white line from (477, 84) to (87, 197).
; PLAN: r0=477(x1), r1=84(y1), r2=87(x2), r3=197(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 84
LDI r2, 87
LDI r3, 197
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
