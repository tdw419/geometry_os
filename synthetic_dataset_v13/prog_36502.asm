; DESCRIPTION: Draws a magenta line from (220, 5) to (189, 69).
; PLAN: r0=220(x1), r1=5(y1), r2=189(x2), r3=69(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 5
LDI r2, 189
LDI r3, 69
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
