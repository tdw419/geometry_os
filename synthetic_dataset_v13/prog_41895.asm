; DESCRIPTION: Renders a yellow line between points (45, 112) and (412, 164).
; PLAN: r0=45(x1), r1=112(y1), r2=412(x2), r3=164(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 112
LDI r2, 412
LDI r3, 164
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
