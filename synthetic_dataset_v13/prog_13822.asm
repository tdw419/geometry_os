; DESCRIPTION: Renders a green line between points (44, 206) and (320, 181).
; PLAN: r0=44(x1), r1=206(y1), r2=320(x2), r3=181(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 206
LDI r2, 320
LDI r3, 181
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
