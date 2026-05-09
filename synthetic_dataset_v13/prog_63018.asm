; DESCRIPTION: Draws a green line from (410, 227) to (132, 30).
; PLAN: r0=410(x1), r1=227(y1), r2=132(x2), r3=30(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 227
LDI r2, 132
LDI r3, 30
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
