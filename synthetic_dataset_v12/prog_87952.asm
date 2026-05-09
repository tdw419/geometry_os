; DESCRIPTION: Draws a blue line from (415, 205) to (478, 46).
; PLAN: r0=415(x1), r1=205(y1), r2=478(x2), r3=46(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 205
LDI r2, 478
LDI r3, 46
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
