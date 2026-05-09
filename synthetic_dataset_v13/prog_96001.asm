; DESCRIPTION: Renders a black line between points (424, 62) and (398, 67).
; PLAN: r0=424(x1), r1=62(y1), r2=398(x2), r3=67(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 62
LDI r2, 398
LDI r3, 67
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
