; DESCRIPTION: Renders a magenta line between points (66, 107) and (243, 8).
; PLAN: r0=66(x1), r1=107(y1), r2=243(x2), r3=8(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 107
LDI r2, 243
LDI r3, 8
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
