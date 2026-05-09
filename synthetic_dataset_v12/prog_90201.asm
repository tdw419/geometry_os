; DESCRIPTION: Renders a magenta line between points (442, 210) and (496, 126).
; PLAN: r0=442(x1), r1=210(y1), r2=496(x2), r3=126(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 210
LDI r2, 496
LDI r3, 126
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
