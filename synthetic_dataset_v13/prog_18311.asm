; DESCRIPTION: Draws a magenta line from (334, 69) to (488, 168).
; PLAN: r0=334(x1), r1=69(y1), r2=488(x2), r3=168(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 69
LDI r2, 488
LDI r3, 168
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
