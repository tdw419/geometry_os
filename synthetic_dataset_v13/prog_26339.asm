; DESCRIPTION: Renders a white line between points (374, 230) and (464, 157).
; PLAN: r0=374(x1), r1=230(y1), r2=464(x2), r3=157(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 230
LDI r2, 464
LDI r3, 157
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
