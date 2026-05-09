; DESCRIPTION: Draws a black line from (441, 20) to (415, 134).
; PLAN: r0=441(x1), r1=20(y1), r2=415(x2), r3=134(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 20
LDI r2, 415
LDI r3, 134
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
