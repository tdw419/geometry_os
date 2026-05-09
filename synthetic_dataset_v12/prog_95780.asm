; DESCRIPTION: Places a cyan line segment connecting (152, 214) to (437, 217).
; PLAN: r0=152(x1), r1=214(y1), r2=437(x2), r3=217(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 214
LDI r2, 437
LDI r3, 217
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
