; DESCRIPTION: Draws a black line from (177, 70) to (285, 62).
; PLAN: r0=177(x1), r1=70(y1), r2=285(x2), r3=62(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 70
LDI r2, 285
LDI r3, 62
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
