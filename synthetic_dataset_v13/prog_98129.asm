; DESCRIPTION: Renders a black line between points (121, 210) and (80, 186).
; PLAN: r0=121(x1), r1=210(y1), r2=80(x2), r3=186(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 210
LDI r2, 80
LDI r3, 186
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
