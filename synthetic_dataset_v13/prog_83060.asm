; DESCRIPTION: Renders a black line between points (208, 110) and (103, 146).
; PLAN: r0=208(x1), r1=110(y1), r2=103(x2), r3=146(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 110
LDI r2, 103
LDI r3, 146
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
