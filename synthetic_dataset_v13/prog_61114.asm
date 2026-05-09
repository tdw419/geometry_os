; DESCRIPTION: Renders a green line between points (206, 192) and (264, 244).
; PLAN: r0=206(x1), r1=192(y1), r2=264(x2), r3=244(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 192
LDI r2, 264
LDI r3, 244
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
