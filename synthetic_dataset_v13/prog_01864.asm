; DESCRIPTION: Renders a magenta line between points (396, 254) and (168, 156).
; PLAN: r0=396(x1), r1=254(y1), r2=168(x2), r3=156(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 254
LDI r2, 168
LDI r3, 156
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
