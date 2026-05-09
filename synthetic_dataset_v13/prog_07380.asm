; DESCRIPTION: Renders a black line between points (392, 95) and (370, 49).
; PLAN: r0=392(x1), r1=95(y1), r2=370(x2), r3=49(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 95
LDI r2, 370
LDI r3, 49
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
