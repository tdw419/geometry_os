; DESCRIPTION: Draws a black line from (249, 171) to (28, 205).
; PLAN: r0=249(x1), r1=171(y1), r2=28(x2), r3=205(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 171
LDI r2, 28
LDI r3, 205
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
