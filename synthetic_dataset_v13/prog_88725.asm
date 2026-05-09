; DESCRIPTION: Renders a black line between points (446, 67) and (476, 25).
; PLAN: r0=446(x1), r1=67(y1), r2=476(x2), r3=25(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 67
LDI r2, 476
LDI r3, 25
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
