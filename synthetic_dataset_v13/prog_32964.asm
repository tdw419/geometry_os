; DESCRIPTION: Draws a blue line from (71, 12) to (164, 176).
; PLAN: r0=71(x1), r1=12(y1), r2=164(x2), r3=176(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 12
LDI r2, 164
LDI r3, 176
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
