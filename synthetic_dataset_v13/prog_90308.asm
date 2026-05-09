; DESCRIPTION: Places a cyan line segment connecting (58, 35) to (152, 234).
; PLAN: r0=58(x1), r1=35(y1), r2=152(x2), r3=234(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 35
LDI r2, 152
LDI r3, 234
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
