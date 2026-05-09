; DESCRIPTION: Renders a white line between points (317, 55) and (206, 84).
; PLAN: r0=317(x1), r1=55(y1), r2=206(x2), r3=84(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 55
LDI r2, 206
LDI r3, 84
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
