; DESCRIPTION: Renders a magenta line between points (412, 191) and (176, 16).
; PLAN: r0=412(x1), r1=191(y1), r2=176(x2), r3=16(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 191
LDI r2, 176
LDI r3, 16
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
