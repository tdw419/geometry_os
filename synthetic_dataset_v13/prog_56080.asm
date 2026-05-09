; DESCRIPTION: Renders a yellow line between points (37, 28) and (226, 231).
; PLAN: r0=37(x1), r1=28(y1), r2=226(x2), r3=231(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 28
LDI r2, 226
LDI r3, 231
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
