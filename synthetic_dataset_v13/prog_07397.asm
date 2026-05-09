; DESCRIPTION: Renders a green line between points (417, 6) and (239, 206).
; PLAN: r0=417(x1), r1=6(y1), r2=239(x2), r3=206(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 6
LDI r2, 239
LDI r3, 206
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
