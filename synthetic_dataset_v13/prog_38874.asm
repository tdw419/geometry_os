; DESCRIPTION: Renders a black line between points (141, 215) and (70, 234).
; PLAN: r0=141(x1), r1=215(y1), r2=70(x2), r3=234(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 215
LDI r2, 70
LDI r3, 234
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
