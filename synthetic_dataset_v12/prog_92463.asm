; DESCRIPTION: Renders a black line between points (24, 196) and (211, 146).
; PLAN: r0=24(x1), r1=196(y1), r2=211(x2), r3=146(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 196
LDI r2, 211
LDI r3, 146
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
