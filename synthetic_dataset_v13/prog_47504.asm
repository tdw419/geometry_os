; DESCRIPTION: Draws a white line from (505, 241) to (393, 12).
; PLAN: r0=505(x1), r1=241(y1), r2=393(x2), r3=12(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 241
LDI r2, 393
LDI r3, 12
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
