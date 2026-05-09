; DESCRIPTION: Renders a green line between points (334, 243) and (265, 135).
; PLAN: r0=334(x1), r1=243(y1), r2=265(x2), r3=135(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 243
LDI r2, 265
LDI r3, 135
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
