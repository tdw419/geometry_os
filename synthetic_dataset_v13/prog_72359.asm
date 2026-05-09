; DESCRIPTION: Renders a black line between points (191, 217) and (242, 173).
; PLAN: r0=191(x1), r1=217(y1), r2=242(x2), r3=173(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 217
LDI r2, 242
LDI r3, 173
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
