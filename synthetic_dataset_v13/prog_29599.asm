; DESCRIPTION: Renders a yellow line between points (483, 46) and (228, 74).
; PLAN: r0=483(x1), r1=46(y1), r2=228(x2), r3=74(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 46
LDI r2, 228
LDI r3, 74
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
