; DESCRIPTION: Renders a white line between points (141, 113) and (434, 59).
; PLAN: r0=141(x1), r1=113(y1), r2=434(x2), r3=59(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 113
LDI r2, 434
LDI r3, 59
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
