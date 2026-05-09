; DESCRIPTION: Renders a black line between points (305, 83) and (413, 64).
; PLAN: r0=305(x1), r1=83(y1), r2=413(x2), r3=64(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 83
LDI r2, 413
LDI r3, 64
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
