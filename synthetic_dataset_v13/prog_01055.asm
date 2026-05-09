; DESCRIPTION: Renders a black line between points (502, 44) and (474, 131).
; PLAN: r0=502(x1), r1=44(y1), r2=474(x2), r3=131(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 44
LDI r2, 474
LDI r3, 131
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
