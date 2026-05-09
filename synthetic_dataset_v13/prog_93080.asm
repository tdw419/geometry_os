; DESCRIPTION: Renders a yellow line between points (461, 243) and (281, 209).
; PLAN: r0=461(x1), r1=243(y1), r2=281(x2), r3=209(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 243
LDI r2, 281
LDI r3, 209
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
