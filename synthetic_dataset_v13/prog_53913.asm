; DESCRIPTION: Draws a black line from (466, 55) to (281, 149).
; PLAN: r0=466(x1), r1=55(y1), r2=281(x2), r3=149(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 55
LDI r2, 281
LDI r3, 149
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
