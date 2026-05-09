; DESCRIPTION: Draws a green line from (475, 99) to (449, 40).
; PLAN: r0=475(x1), r1=99(y1), r2=449(x2), r3=40(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 99
LDI r2, 449
LDI r3, 40
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
