; DESCRIPTION: Draws a blue line from (227, 242) to (255, 167).
; PLAN: r0=227(x1), r1=242(y1), r2=255(x2), r3=167(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 242
LDI r2, 255
LDI r3, 167
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
