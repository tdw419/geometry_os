; DESCRIPTION: Renders a red line between points (201, 173) and (255, 87).
; PLAN: r0=201(x1), r1=173(y1), r2=255(x2), r3=87(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 173
LDI r2, 255
LDI r3, 87
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
