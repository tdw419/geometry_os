; DESCRIPTION: Draws a white line from (11, 64) to (315, 237).
; PLAN: r0=11(x1), r1=64(y1), r2=315(x2), r3=237(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 64
LDI r2, 315
LDI r3, 237
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
