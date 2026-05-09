; DESCRIPTION: Renders a magenta line between points (354, 112) and (223, 126).
; PLAN: r0=354(x1), r1=112(y1), r2=223(x2), r3=126(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 112
LDI r2, 223
LDI r3, 126
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
