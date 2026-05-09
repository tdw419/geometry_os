; DESCRIPTION: Renders a magenta line between points (317, 130) and (326, 206).
; PLAN: r0=317(x1), r1=130(y1), r2=326(x2), r3=206(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 130
LDI r2, 326
LDI r3, 206
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
