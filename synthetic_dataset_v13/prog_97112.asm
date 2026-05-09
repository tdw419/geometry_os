; DESCRIPTION: Draws a black line from (168, 212) to (223, 135).
; PLAN: r0=168(x1), r1=212(y1), r2=223(x2), r3=135(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 212
LDI r2, 223
LDI r3, 135
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
