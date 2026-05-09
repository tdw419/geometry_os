; DESCRIPTION: Renders a red line between points (48, 152) and (420, 149).
; PLAN: r0=48(x1), r1=152(y1), r2=420(x2), r3=149(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 152
LDI r2, 420
LDI r3, 149
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
