; DESCRIPTION: Places a black line segment connecting (75, 221) to (281, 80).
; PLAN: r0=75(x1), r1=221(y1), r2=281(x2), r3=80(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 221
LDI r2, 281
LDI r3, 80
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
