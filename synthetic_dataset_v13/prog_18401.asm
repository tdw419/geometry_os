; DESCRIPTION: Draws a magenta line from (467, 233) to (68, 37).
; PLAN: r0=467(x1), r1=233(y1), r2=68(x2), r3=37(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 233
LDI r2, 68
LDI r3, 37
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
