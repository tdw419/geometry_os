; DESCRIPTION: Renders a red line between points (32, 135) and (90, 47).
; PLAN: r0=32(x1), r1=135(y1), r2=90(x2), r3=47(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 135
LDI r2, 90
LDI r3, 47
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
