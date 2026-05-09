; DESCRIPTION: Places a yellow line segment connecting (488, 112) to (464, 102).
; PLAN: r0=488(x1), r1=112(y1), r2=464(x2), r3=102(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 112
LDI r2, 464
LDI r3, 102
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
