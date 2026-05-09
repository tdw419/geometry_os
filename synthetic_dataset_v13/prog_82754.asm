; DESCRIPTION: Renders a magenta line between points (340, 246) and (65, 243).
; PLAN: r0=340(x1), r1=246(y1), r2=65(x2), r3=243(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 246
LDI r2, 65
LDI r3, 243
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
