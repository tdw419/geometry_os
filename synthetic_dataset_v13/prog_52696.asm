; DESCRIPTION: Renders a black line between points (403, 205) and (250, 180).
; PLAN: r0=403(x1), r1=205(y1), r2=250(x2), r3=180(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 205
LDI r2, 250
LDI r3, 180
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
