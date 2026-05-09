; DESCRIPTION: Draws a red line from (78, 128) to (92, 244).
; PLAN: r0=78(x1), r1=128(y1), r2=92(x2), r3=244(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 128
LDI r2, 92
LDI r3, 244
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
