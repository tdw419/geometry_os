; DESCRIPTION: Draws a white line from (258, 164) to (16, 78).
; PLAN: r0=258(x1), r1=164(y1), r2=16(x2), r3=78(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 164
LDI r2, 16
LDI r3, 78
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
