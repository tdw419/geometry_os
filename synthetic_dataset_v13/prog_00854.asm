; DESCRIPTION: Places a cyan line segment connecting (459, 10) to (117, 169).
; PLAN: r0=459(x1), r1=10(y1), r2=117(x2), r3=169(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 10
LDI r2, 117
LDI r3, 169
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
