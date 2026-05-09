; DESCRIPTION: Renders a magenta line between points (496, 206) and (487, 65).
; PLAN: r0=496(x1), r1=206(y1), r2=487(x2), r3=65(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 206
LDI r2, 487
LDI r3, 65
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
