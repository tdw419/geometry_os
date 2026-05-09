; DESCRIPTION: Renders a green line between points (265, 21) and (1, 57).
; PLAN: r0=265(x1), r1=21(y1), r2=1(x2), r3=57(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 21
LDI r2, 1
LDI r3, 57
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
