; DESCRIPTION: Places a cyan line segment connecting (286, 223) to (232, 2).
; PLAN: r0=286(x1), r1=223(y1), r2=232(x2), r3=2(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 223
LDI r2, 232
LDI r3, 2
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
