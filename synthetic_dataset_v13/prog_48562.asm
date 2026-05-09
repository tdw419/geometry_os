; DESCRIPTION: Renders a black line between points (356, 33) and (327, 221).
; PLAN: r0=356(x1), r1=33(y1), r2=327(x2), r3=221(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 33
LDI r2, 327
LDI r3, 221
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
