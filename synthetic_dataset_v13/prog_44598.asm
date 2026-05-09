; DESCRIPTION: Draws a magenta line from (341, 116) to (214, 69).
; PLAN: r0=341(x1), r1=116(y1), r2=214(x2), r3=69(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 116
LDI r2, 214
LDI r3, 69
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
