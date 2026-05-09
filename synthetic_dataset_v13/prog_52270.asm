; DESCRIPTION: Renders a yellow line between points (57, 243) and (406, 46).
; PLAN: r0=57(x1), r1=243(y1), r2=406(x2), r3=46(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 243
LDI r2, 406
LDI r3, 46
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
