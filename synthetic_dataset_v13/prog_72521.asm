; DESCRIPTION: Draws a green line from (18, 156) to (370, 30).
; PLAN: r0=18(x1), r1=156(y1), r2=370(x2), r3=30(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 156
LDI r2, 370
LDI r3, 30
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
