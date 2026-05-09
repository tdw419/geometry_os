; DESCRIPTION: Draws a black line from (458, 167) to (440, 246).
; PLAN: r0=458(x1), r1=167(y1), r2=440(x2), r3=246(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 167
LDI r2, 440
LDI r3, 246
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
