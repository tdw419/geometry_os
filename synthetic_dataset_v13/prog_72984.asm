; DESCRIPTION: Draws a magenta line from (416, 228) to (52, 69).
; PLAN: r0=416(x1), r1=228(y1), r2=52(x2), r3=69(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 228
LDI r2, 52
LDI r3, 69
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
