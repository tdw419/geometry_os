; DESCRIPTION: Renders a yellow line between points (327, 90) and (76, 59).
; PLAN: r0=327(x1), r1=90(y1), r2=76(x2), r3=59(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 90
LDI r2, 76
LDI r3, 59
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
