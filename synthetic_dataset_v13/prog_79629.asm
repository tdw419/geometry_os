; DESCRIPTION: Places a red line segment connecting (82, 102) to (450, 152).
; PLAN: r0=82(x1), r1=102(y1), r2=450(x2), r3=152(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 102
LDI r2, 450
LDI r3, 152
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
