; DESCRIPTION: Draws a green line from (207, 17) to (345, 13).
; PLAN: r0=207(x1), r1=17(y1), r2=345(x2), r3=13(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 17
LDI r2, 345
LDI r3, 13
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
