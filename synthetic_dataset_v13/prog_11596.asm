; DESCRIPTION: Places a red line segment connecting (4, 117) to (487, 69).
; PLAN: r0=4(x1), r1=117(y1), r2=487(x2), r3=69(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 117
LDI r2, 487
LDI r3, 69
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
