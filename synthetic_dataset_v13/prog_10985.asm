; DESCRIPTION: Draws a magenta line from (481, 109) to (141, 228).
; PLAN: r0=481(x1), r1=109(y1), r2=141(x2), r3=228(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 109
LDI r2, 141
LDI r3, 228
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
