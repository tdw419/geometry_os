; DESCRIPTION: Renders a magenta line between points (53, 176) and (409, 86).
; PLAN: r0=53(x1), r1=176(y1), r2=409(x2), r3=86(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 176
LDI r2, 409
LDI r3, 86
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
