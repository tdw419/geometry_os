; DESCRIPTION: Renders a magenta line between points (297, 23) and (168, 209).
; PLAN: r0=297(x1), r1=23(y1), r2=168(x2), r3=209(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 23
LDI r2, 168
LDI r3, 209
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
