; DESCRIPTION: Places a cyan line segment connecting (283, 121) to (79, 7).
; PLAN: r0=283(x1), r1=121(y1), r2=79(x2), r3=7(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 121
LDI r2, 79
LDI r3, 7
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
