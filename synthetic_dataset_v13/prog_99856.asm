; DESCRIPTION: Draws a magenta line from (245, 124) to (133, 42).
; PLAN: r0=245(x1), r1=124(y1), r2=133(x2), r3=42(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 124
LDI r2, 133
LDI r3, 42
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
