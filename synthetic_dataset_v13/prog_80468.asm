; DESCRIPTION: Renders a blue line between points (225, 152) and (134, 113).
; PLAN: r0=225(x1), r1=152(y1), r2=134(x2), r3=113(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 152
LDI r2, 134
LDI r3, 113
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
