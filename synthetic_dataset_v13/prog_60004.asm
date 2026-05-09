; DESCRIPTION: Renders a green line between points (409, 205) and (73, 243).
; PLAN: r0=409(x1), r1=205(y1), r2=73(x2), r3=243(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 205
LDI r2, 73
LDI r3, 243
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
