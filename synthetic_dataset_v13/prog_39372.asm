; DESCRIPTION: Renders a magenta line between points (405, 128) and (33, 163).
; PLAN: r0=405(x1), r1=128(y1), r2=33(x2), r3=163(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 128
LDI r2, 33
LDI r3, 163
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
