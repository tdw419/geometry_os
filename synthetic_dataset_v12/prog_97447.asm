; DESCRIPTION: Places a red line segment connecting (449, 55) to (346, 79).
; PLAN: r0=449(x1), r1=55(y1), r2=346(x2), r3=79(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 55
LDI r2, 346
LDI r3, 79
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
