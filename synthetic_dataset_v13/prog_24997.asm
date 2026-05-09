; DESCRIPTION: Renders a red line between points (440, 124) and (33, 5).
; PLAN: r0=440(x1), r1=124(y1), r2=33(x2), r3=5(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 124
LDI r2, 33
LDI r3, 5
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
