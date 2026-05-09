; DESCRIPTION: Draws a green line from (464, 219) to (47, 186).
; PLAN: r0=464(x1), r1=219(y1), r2=47(x2), r3=186(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 219
LDI r2, 47
LDI r3, 186
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
