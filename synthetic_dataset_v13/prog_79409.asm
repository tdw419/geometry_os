; DESCRIPTION: Draws a green line from (31, 34) to (83, 57).
; PLAN: r0=31(x1), r1=34(y1), r2=83(x2), r3=57(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 34
LDI r2, 83
LDI r3, 57
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
