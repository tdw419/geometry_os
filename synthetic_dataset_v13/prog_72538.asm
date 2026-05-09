; DESCRIPTION: Draws a yellow line from (257, 102) to (342, 34).
; PLAN: r0=257(x1), r1=102(y1), r2=342(x2), r3=34(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 102
LDI r2, 342
LDI r3, 34
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
