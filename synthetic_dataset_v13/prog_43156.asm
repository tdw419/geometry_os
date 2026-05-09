; DESCRIPTION: Renders a white line between points (141, 240) and (108, 15).
; PLAN: r0=141(x1), r1=240(y1), r2=108(x2), r3=15(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 240
LDI r2, 108
LDI r3, 15
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
