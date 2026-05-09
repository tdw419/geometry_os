; DESCRIPTION: Renders a magenta line between points (354, 53) and (289, 71).
; PLAN: r0=354(x1), r1=53(y1), r2=289(x2), r3=71(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 53
LDI r2, 289
LDI r3, 71
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
