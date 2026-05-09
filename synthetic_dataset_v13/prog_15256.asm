; DESCRIPTION: Places a cyan line segment connecting (493, 69) to (49, 94).
; PLAN: r0=493(x1), r1=69(y1), r2=49(x2), r3=94(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 69
LDI r2, 49
LDI r3, 94
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
