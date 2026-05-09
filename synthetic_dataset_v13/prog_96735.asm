; DESCRIPTION: Renders a black line between points (82, 141) and (161, 193).
; PLAN: r0=82(x1), r1=141(y1), r2=161(x2), r3=193(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 141
LDI r2, 161
LDI r3, 193
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
