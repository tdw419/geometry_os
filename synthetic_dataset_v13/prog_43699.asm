; DESCRIPTION: Renders a blue line between points (178, 192) and (113, 152).
; PLAN: r0=178(x1), r1=192(y1), r2=113(x2), r3=152(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 192
LDI r2, 113
LDI r3, 152
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
