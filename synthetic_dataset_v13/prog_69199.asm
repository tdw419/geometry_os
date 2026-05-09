; DESCRIPTION: Renders a white line between points (431, 206) and (464, 152).
; PLAN: r0=431(x1), r1=206(y1), r2=464(x2), r3=152(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 206
LDI r2, 464
LDI r3, 152
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
