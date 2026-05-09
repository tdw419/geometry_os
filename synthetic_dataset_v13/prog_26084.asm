; DESCRIPTION: Renders a magenta line between points (262, 130) and (87, 249).
; PLAN: r0=262(x1), r1=130(y1), r2=87(x2), r3=249(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 130
LDI r2, 87
LDI r3, 249
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
