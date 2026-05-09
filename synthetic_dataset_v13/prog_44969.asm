; DESCRIPTION: Draws a black line from (288, 146) to (396, 246).
; PLAN: r0=288(x1), r1=146(y1), r2=396(x2), r3=246(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 146
LDI r2, 396
LDI r3, 246
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
