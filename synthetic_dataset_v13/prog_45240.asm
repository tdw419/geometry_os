; DESCRIPTION: Renders a green line between points (112, 87) and (66, 146).
; PLAN: r0=112(x1), r1=87(y1), r2=66(x2), r3=146(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 87
LDI r2, 66
LDI r3, 146
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
