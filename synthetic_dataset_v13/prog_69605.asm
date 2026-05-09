; DESCRIPTION: Renders a magenta line between points (30, 44) and (245, 19).
; PLAN: r0=30(x1), r1=44(y1), r2=245(x2), r3=19(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 44
LDI r2, 245
LDI r3, 19
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
