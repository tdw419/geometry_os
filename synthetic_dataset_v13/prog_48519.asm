; DESCRIPTION: Draws a magenta line from (498, 154) to (270, 228).
; PLAN: r0=498(x1), r1=154(y1), r2=270(x2), r3=228(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 154
LDI r2, 270
LDI r3, 228
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
