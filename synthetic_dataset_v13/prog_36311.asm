; DESCRIPTION: Draws a blue line from (73, 154) to (458, 244).
; PLAN: r0=73(x1), r1=154(y1), r2=458(x2), r3=244(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 154
LDI r2, 458
LDI r3, 244
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
