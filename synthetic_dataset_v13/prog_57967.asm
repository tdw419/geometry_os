; DESCRIPTION: Renders a yellow line between points (243, 98) and (281, 248).
; PLAN: r0=243(x1), r1=98(y1), r2=281(x2), r3=248(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 98
LDI r2, 281
LDI r3, 248
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
