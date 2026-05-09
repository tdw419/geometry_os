; DESCRIPTION: Renders a blue line between points (376, 186) and (27, 239).
; PLAN: r0=376(x1), r1=186(y1), r2=27(x2), r3=239(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 186
LDI r2, 27
LDI r3, 239
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
