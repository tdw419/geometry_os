; DESCRIPTION: Renders a yellow line between points (46, 65) and (487, 129).
; PLAN: r0=46(x1), r1=65(y1), r2=487(x2), r3=129(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 65
LDI r2, 487
LDI r3, 129
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
