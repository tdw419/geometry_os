; DESCRIPTION: Places a cyan line segment connecting (71, 57) to (407, 79).
; PLAN: r0=71(x1), r1=57(y1), r2=407(x2), r3=79(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 57
LDI r2, 407
LDI r3, 79
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
