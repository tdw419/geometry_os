; DESCRIPTION: Places a green line segment connecting (31, 33) to (488, 225).
; PLAN: r0=31(x1), r1=33(y1), r2=488(x2), r3=225(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 33
LDI r2, 488
LDI r3, 225
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
