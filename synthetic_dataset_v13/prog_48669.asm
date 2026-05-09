; DESCRIPTION: Renders a red line between points (480, 2) and (16, 74).
; PLAN: r0=480(x1), r1=2(y1), r2=16(x2), r3=74(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 2
LDI r2, 16
LDI r3, 74
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
