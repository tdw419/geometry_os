; DESCRIPTION: Draws a magenta line from (392, 126) to (488, 112).
; PLAN: r0=392(x1), r1=126(y1), r2=488(x2), r3=112(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 126
LDI r2, 488
LDI r3, 112
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
