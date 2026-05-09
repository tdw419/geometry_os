; DESCRIPTION: Draws a red line from (237, 3) to (294, 181).
; PLAN: r0=237(x1), r1=3(y1), r2=294(x2), r3=181(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 3
LDI r2, 294
LDI r3, 181
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
