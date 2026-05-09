; DESCRIPTION: Renders a green line between points (24, 69) and (59, 244).
; PLAN: r0=24(x1), r1=69(y1), r2=59(x2), r3=244(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 69
LDI r2, 59
LDI r3, 244
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
