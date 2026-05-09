; DESCRIPTION: Draws a white line from (441, 51) to (231, 198).
; PLAN: r0=441(x1), r1=51(y1), r2=231(x2), r3=198(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 51
LDI r2, 231
LDI r3, 198
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
