; DESCRIPTION: Renders a white line between points (502, 121) and (318, 163).
; PLAN: r0=502(x1), r1=121(y1), r2=318(x2), r3=163(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 121
LDI r2, 318
LDI r3, 163
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
