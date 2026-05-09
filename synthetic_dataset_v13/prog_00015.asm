; DESCRIPTION: Renders a black line between points (488, 205) and (141, 24).
; PLAN: r0=488(x1), r1=205(y1), r2=141(x2), r3=24(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 205
LDI r2, 141
LDI r3, 24
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
