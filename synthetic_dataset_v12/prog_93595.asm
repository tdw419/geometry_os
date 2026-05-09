; DESCRIPTION: Renders a magenta line between points (44, 161) and (236, 42).
; PLAN: r0=44(x1), r1=161(y1), r2=236(x2), r3=42(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 161
LDI r2, 236
LDI r3, 42
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
