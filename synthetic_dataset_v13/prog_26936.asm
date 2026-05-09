; DESCRIPTION: Places a red line segment connecting (295, 168) to (325, 87).
; PLAN: r0=295(x1), r1=168(y1), r2=325(x2), r3=87(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 168
LDI r2, 325
LDI r3, 87
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
