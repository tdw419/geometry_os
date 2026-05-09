; DESCRIPTION: Renders a yellow line between points (262, 142) and (360, 28).
; PLAN: r0=262(x1), r1=142(y1), r2=360(x2), r3=28(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 142
LDI r2, 360
LDI r3, 28
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
