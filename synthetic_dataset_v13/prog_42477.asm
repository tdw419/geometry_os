; DESCRIPTION: Draws a magenta line from (109, 221) to (504, 36).
; PLAN: r0=109(x1), r1=221(y1), r2=504(x2), r3=36(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 221
LDI r2, 504
LDI r3, 36
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
