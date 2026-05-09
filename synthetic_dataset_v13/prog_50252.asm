; DESCRIPTION: Places a white line segment connecting (264, 229) to (488, 68).
; PLAN: r0=264(x1), r1=229(y1), r2=488(x2), r3=68(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 229
LDI r2, 488
LDI r3, 68
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
