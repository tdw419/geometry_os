; DESCRIPTION: Draws a green line from (364, 187) to (34, 33).
; PLAN: r0=364(x1), r1=187(y1), r2=34(x2), r3=33(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 187
LDI r2, 34
LDI r3, 33
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
