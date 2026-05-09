; DESCRIPTION: Draws a magenta line from (324, 54) to (182, 228).
; PLAN: r0=324(x1), r1=54(y1), r2=182(x2), r3=228(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 54
LDI r2, 182
LDI r3, 228
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
