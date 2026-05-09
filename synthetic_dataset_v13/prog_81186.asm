; DESCRIPTION: Draws a green line from (345, 207) to (247, 87).
; PLAN: r0=345(x1), r1=207(y1), r2=247(x2), r3=87(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 207
LDI r2, 247
LDI r3, 87
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
