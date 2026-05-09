; DESCRIPTION: Renders a blue line between points (59, 168) and (464, 83).
; PLAN: r0=59(x1), r1=168(y1), r2=464(x2), r3=83(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 168
LDI r2, 464
LDI r3, 83
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
