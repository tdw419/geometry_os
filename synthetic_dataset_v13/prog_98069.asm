; DESCRIPTION: Draws a black line from (40, 59) to (237, 39).
; PLAN: r0=40(x1), r1=59(y1), r2=237(x2), r3=39(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 59
LDI r2, 237
LDI r3, 39
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
