; DESCRIPTION: Renders a magenta line between points (70, 213) and (335, 177).
; PLAN: r0=70(x1), r1=213(y1), r2=335(x2), r3=177(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 213
LDI r2, 335
LDI r3, 177
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
