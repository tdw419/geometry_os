; DESCRIPTION: Draws a black line from (171, 255) to (49, 22).
; PLAN: r0=171(x1), r1=255(y1), r2=49(x2), r3=22(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 255
LDI r2, 49
LDI r3, 22
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
