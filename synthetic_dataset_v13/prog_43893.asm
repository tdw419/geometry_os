; DESCRIPTION: Draws a magenta line from (228, 37) to (4, 31).
; PLAN: r0=228(x1), r1=37(y1), r2=4(x2), r3=31(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 37
LDI r2, 4
LDI r3, 31
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
