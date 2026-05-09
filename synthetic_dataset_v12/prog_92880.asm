; DESCRIPTION: Draws a green line from (153, 16) to (302, 41).
; PLAN: r0=153(x1), r1=16(y1), r2=302(x2), r3=41(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 16
LDI r2, 302
LDI r3, 41
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
