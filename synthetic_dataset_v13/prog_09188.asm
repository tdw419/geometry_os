; DESCRIPTION: Renders a green line between points (47, 144) and (255, 115).
; PLAN: r0=47(x1), r1=144(y1), r2=255(x2), r3=115(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 144
LDI r2, 255
LDI r3, 115
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
