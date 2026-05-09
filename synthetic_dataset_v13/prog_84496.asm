; DESCRIPTION: Renders a magenta line between points (213, 9) and (65, 174).
; PLAN: r0=213(x1), r1=9(y1), r2=65(x2), r3=174(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 9
LDI r2, 65
LDI r3, 174
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
