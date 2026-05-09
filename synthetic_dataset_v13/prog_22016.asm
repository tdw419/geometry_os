; DESCRIPTION: Renders a black line between points (202, 193) and (142, 221).
; PLAN: r0=202(x1), r1=193(y1), r2=142(x2), r3=221(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 193
LDI r2, 142
LDI r3, 221
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
