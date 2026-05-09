; DESCRIPTION: Draws a black line from (339, 30) to (210, 70).
; PLAN: r0=339(x1), r1=30(y1), r2=210(x2), r3=70(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 30
LDI r2, 210
LDI r3, 70
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
