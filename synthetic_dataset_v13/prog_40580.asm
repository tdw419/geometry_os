; DESCRIPTION: Draws a blue line from (474, 239) to (186, 76).
; PLAN: r0=474(x1), r1=239(y1), r2=186(x2), r3=76(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 239
LDI r2, 186
LDI r3, 76
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
