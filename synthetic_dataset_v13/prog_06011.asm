; DESCRIPTION: Renders a green line between points (71, 81) and (280, 83).
; PLAN: r0=71(x1), r1=81(y1), r2=280(x2), r3=83(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 81
LDI r2, 280
LDI r3, 83
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
