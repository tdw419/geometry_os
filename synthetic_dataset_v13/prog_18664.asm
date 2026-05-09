; DESCRIPTION: Places a green line segment connecting (349, 103) to (116, 55).
; PLAN: r0=349(x1), r1=103(y1), r2=116(x2), r3=55(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 103
LDI r2, 116
LDI r3, 55
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
