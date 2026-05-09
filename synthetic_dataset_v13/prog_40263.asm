; DESCRIPTION: Draws a green line from (424, 60) to (332, 89).
; PLAN: r0=424(x1), r1=60(y1), r2=332(x2), r3=89(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 60
LDI r2, 332
LDI r3, 89
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
