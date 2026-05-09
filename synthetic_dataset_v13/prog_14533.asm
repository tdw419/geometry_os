; DESCRIPTION: Renders a green line between points (186, 255) and (209, 62).
; PLAN: r0=186(x1), r1=255(y1), r2=209(x2), r3=62(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 255
LDI r2, 209
LDI r3, 62
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
