; DESCRIPTION: Places a white line segment connecting (71, 73) to (488, 90).
; PLAN: r0=71(x1), r1=73(y1), r2=488(x2), r3=90(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 73
LDI r2, 488
LDI r3, 90
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
