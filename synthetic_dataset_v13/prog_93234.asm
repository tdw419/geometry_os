; DESCRIPTION: Places a red line segment connecting (303, 69) to (406, 12).
; PLAN: r0=303(x1), r1=69(y1), r2=406(x2), r3=12(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 69
LDI r2, 406
LDI r3, 12
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
