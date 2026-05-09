; DESCRIPTION: Draws a blue line from (415, 1) to (420, 192).
; PLAN: r0=415(x1), r1=1(y1), r2=420(x2), r3=192(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 1
LDI r2, 420
LDI r3, 192
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
