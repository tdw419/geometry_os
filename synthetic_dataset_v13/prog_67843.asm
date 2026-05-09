; DESCRIPTION: Draws a magenta line from (488, 251) to (109, 213).
; PLAN: r0=488(x1), r1=251(y1), r2=109(x2), r3=213(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 251
LDI r2, 109
LDI r3, 213
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
