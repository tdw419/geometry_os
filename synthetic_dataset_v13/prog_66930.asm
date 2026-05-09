; DESCRIPTION: Draws a magenta line from (488, 193) to (49, 176).
; PLAN: r0=488(x1), r1=193(y1), r2=49(x2), r3=176(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 193
LDI r2, 49
LDI r3, 176
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
