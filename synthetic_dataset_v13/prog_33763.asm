; DESCRIPTION: Renders a magenta line between points (206, 99) and (202, 249).
; PLAN: r0=206(x1), r1=99(y1), r2=202(x2), r3=249(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 99
LDI r2, 202
LDI r3, 249
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
