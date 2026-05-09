; DESCRIPTION: Renders a purple line between points (435, 239) and (393, 159).
; PLAN: r0=435(x1), r1=239(y1), r2=393(x2), r3=159(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 239
LDI r2, 393
LDI r3, 159
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
