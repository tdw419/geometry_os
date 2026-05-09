; DESCRIPTION: Draws a red line from (29, 212) to (237, 243).
; PLAN: r0=29(x1), r1=212(y1), r2=237(x2), r3=243(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 212
LDI r2, 237
LDI r3, 243
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
