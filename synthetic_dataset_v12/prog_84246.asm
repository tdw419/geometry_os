; DESCRIPTION: Renders a yellow line between points (161, 160) and (394, 255).
; PLAN: r0=161(x1), r1=160(y1), r2=394(x2), r3=255(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 160
LDI r2, 394
LDI r3, 255
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
