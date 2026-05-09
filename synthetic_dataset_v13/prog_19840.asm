; DESCRIPTION: Renders a magenta line between points (244, 168) and (166, 148).
; PLAN: r0=244(x1), r1=168(y1), r2=166(x2), r3=148(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 168
LDI r2, 166
LDI r3, 148
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
