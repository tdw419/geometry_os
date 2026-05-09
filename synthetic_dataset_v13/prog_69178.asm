; DESCRIPTION: Renders a black line between points (495, 249) and (81, 113).
; PLAN: r0=495(x1), r1=249(y1), r2=81(x2), r3=113(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 249
LDI r2, 81
LDI r3, 113
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
