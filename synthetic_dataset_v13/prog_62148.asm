; DESCRIPTION: Places a white line segment connecting (405, 215) to (488, 1).
; PLAN: r0=405(x1), r1=215(y1), r2=488(x2), r3=1(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 215
LDI r2, 488
LDI r3, 1
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
