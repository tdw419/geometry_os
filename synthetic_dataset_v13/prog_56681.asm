; DESCRIPTION: Draws a blue line from (186, 233) to (91, 239).
; PLAN: r0=186(x1), r1=233(y1), r2=91(x2), r3=239(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 233
LDI r2, 91
LDI r3, 239
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
