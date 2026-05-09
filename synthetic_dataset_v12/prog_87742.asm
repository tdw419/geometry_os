; DESCRIPTION: Draws a red line from (333, 3) to (223, 199).
; PLAN: r0=333(x1), r1=3(y1), r2=223(x2), r3=199(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 3
LDI r2, 223
LDI r3, 199
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
