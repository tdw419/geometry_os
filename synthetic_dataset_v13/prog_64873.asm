; DESCRIPTION: Places a green line segment connecting (213, 122) to (488, 10).
; PLAN: r0=213(x1), r1=122(y1), r2=488(x2), r3=10(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 122
LDI r2, 488
LDI r3, 10
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
