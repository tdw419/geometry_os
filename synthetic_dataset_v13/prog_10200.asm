; DESCRIPTION: Draws a black line from (232, 33) to (440, 134).
; PLAN: r0=232(x1), r1=33(y1), r2=440(x2), r3=134(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 33
LDI r2, 440
LDI r3, 134
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
