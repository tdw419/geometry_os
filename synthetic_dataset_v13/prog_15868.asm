; DESCRIPTION: Renders a purple line between points (470, 165) and (239, 221).
; PLAN: r0=470(x1), r1=165(y1), r2=239(x2), r3=221(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 165
LDI r2, 239
LDI r3, 221
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
