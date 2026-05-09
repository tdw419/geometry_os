; DESCRIPTION: Draws a red line from (288, 176) to (258, 76).
; PLAN: r0=288(x1), r1=176(y1), r2=258(x2), r3=76(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 176
LDI r2, 258
LDI r3, 76
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
