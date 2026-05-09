; DESCRIPTION: Renders a blue line between points (346, 171) and (188, 83).
; PLAN: r0=346(x1), r1=171(y1), r2=188(x2), r3=83(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 171
LDI r2, 188
LDI r3, 83
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
