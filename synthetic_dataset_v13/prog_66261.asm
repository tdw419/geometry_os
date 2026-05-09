; DESCRIPTION: Draws a green line from (96, 44) to (437, 70).
; PLAN: r0=96(x1), r1=44(y1), r2=437(x2), r3=70(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 44
LDI r2, 437
LDI r3, 70
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
