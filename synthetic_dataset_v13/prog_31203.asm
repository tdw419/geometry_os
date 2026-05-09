; DESCRIPTION: Renders a yellow line between points (487, 62) and (160, 4).
; PLAN: r0=487(x1), r1=62(y1), r2=160(x2), r3=4(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 62
LDI r2, 160
LDI r3, 4
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
