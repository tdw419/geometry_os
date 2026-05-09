; DESCRIPTION: Renders a blue line between points (379, 239) and (97, 113).
; PLAN: r0=379(x1), r1=239(y1), r2=97(x2), r3=113(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 239
LDI r2, 97
LDI r3, 113
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
