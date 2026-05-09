; DESCRIPTION: Draws a black line from (173, 206) to (134, 216).
; PLAN: r0=173(x1), r1=206(y1), r2=134(x2), r3=216(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 206
LDI r2, 134
LDI r3, 216
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
