; DESCRIPTION: Places a cyan line segment connecting (330, 79) to (458, 152).
; PLAN: r0=330(x1), r1=79(y1), r2=458(x2), r3=152(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 79
LDI r2, 458
LDI r3, 152
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
