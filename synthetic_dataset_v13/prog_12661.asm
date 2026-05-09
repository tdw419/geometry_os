; DESCRIPTION: Places a magenta line segment connecting (488, 174) to (432, 198).
; PLAN: r0=488(x1), r1=174(y1), r2=432(x2), r3=198(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 174
LDI r2, 432
LDI r3, 198
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
