; DESCRIPTION: Renders a yellow line between points (50, 226) and (268, 3).
; PLAN: r0=50(x1), r1=226(y1), r2=268(x2), r3=3(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 226
LDI r2, 268
LDI r3, 3
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
