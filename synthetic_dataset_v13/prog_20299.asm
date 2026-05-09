; DESCRIPTION: Renders a black line between points (113, 55) and (80, 174).
; PLAN: r0=113(x1), r1=55(y1), r2=80(x2), r3=174(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 55
LDI r2, 80
LDI r3, 174
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
