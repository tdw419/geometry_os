; DESCRIPTION: Renders a blue line between points (221, 111) and (464, 143).
; PLAN: r0=221(x1), r1=111(y1), r2=464(x2), r3=143(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 111
LDI r2, 464
LDI r3, 143
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
