; DESCRIPTION: Places a yellow line segment connecting (198, 87) to (488, 81).
; PLAN: r0=198(x1), r1=87(y1), r2=488(x2), r3=81(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 87
LDI r2, 488
LDI r3, 81
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
