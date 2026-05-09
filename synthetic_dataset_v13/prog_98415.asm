; DESCRIPTION: Draws a green line from (252, 20) to (166, 46).
; PLAN: r0=252(x1), r1=20(y1), r2=166(x2), r3=46(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 20
LDI r2, 166
LDI r3, 46
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
