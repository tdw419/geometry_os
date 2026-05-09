; DESCRIPTION: Renders a magenta line between points (218, 42) and (438, 0).
; PLAN: r0=218(x1), r1=42(y1), r2=438(x2), r3=0(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 42
LDI r2, 438
LDI r3, 0
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
