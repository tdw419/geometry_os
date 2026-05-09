; DESCRIPTION: Renders a white line between points (206, 121) and (56, 113).
; PLAN: r0=206(x1), r1=121(y1), r2=56(x2), r3=113(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 121
LDI r2, 56
LDI r3, 113
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
