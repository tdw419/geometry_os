; DESCRIPTION: Places a magenta line segment connecting (481, 205) to (488, 49).
; PLAN: r0=481(x1), r1=205(y1), r2=488(x2), r3=49(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 205
LDI r2, 488
LDI r3, 49
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
