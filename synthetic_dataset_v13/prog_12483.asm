; DESCRIPTION: Draws a black line from (420, 255) to (385, 237).
; PLAN: r0=420(x1), r1=255(y1), r2=385(x2), r3=237(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 255
LDI r2, 385
LDI r3, 237
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
