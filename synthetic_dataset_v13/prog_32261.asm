; DESCRIPTION: Draws a magenta line from (504, 77) to (76, 42).
; PLAN: r0=504(x1), r1=77(y1), r2=76(x2), r3=42(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 77
LDI r2, 76
LDI r3, 42
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
