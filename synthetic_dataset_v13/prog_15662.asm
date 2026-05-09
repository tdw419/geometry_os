; DESCRIPTION: Renders a black line between points (356, 50) and (199, 57).
; PLAN: r0=356(x1), r1=50(y1), r2=199(x2), r3=57(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 50
LDI r2, 199
LDI r3, 57
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
