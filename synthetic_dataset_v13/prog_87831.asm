; DESCRIPTION: Draws a white line from (505, 161) to (12, 176).
; PLAN: r0=505(x1), r1=161(y1), r2=12(x2), r3=176(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 161
LDI r2, 12
LDI r3, 176
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
