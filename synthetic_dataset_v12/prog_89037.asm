; DESCRIPTION: Renders a blue line between points (295, 83) and (239, 169).
; PLAN: r0=295(x1), r1=83(y1), r2=239(x2), r3=169(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 83
LDI r2, 239
LDI r3, 169
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
