; DESCRIPTION: Draws a magenta line from (226, 30) to (488, 200).
; PLAN: r0=226(x1), r1=30(y1), r2=488(x2), r3=200(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 30
LDI r2, 488
LDI r3, 200
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
