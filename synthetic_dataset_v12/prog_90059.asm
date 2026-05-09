; DESCRIPTION: Renders a green line between points (503, 186) and (255, 108).
; PLAN: r0=503(x1), r1=186(y1), r2=255(x2), r3=108(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 186
LDI r2, 255
LDI r3, 108
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
