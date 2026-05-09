; DESCRIPTION: Renders a black line between points (225, 3) and (488, 243).
; PLAN: r0=225(x1), r1=3(y1), r2=488(x2), r3=243(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 3
LDI r2, 488
LDI r3, 243
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
