; DESCRIPTION: Renders a magenta line between points (333, 240) and (337, 212).
; PLAN: r0=333(x1), r1=240(y1), r2=337(x2), r3=212(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 240
LDI r2, 337
LDI r3, 212
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
