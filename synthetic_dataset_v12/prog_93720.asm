; DESCRIPTION: Places a black line segment connecting (306, 221) to (70, 77).
; PLAN: r0=306(x1), r1=221(y1), r2=70(x2), r3=77(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 221
LDI r2, 70
LDI r3, 77
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
