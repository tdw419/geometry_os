; DESCRIPTION: Places a red line segment connecting (341, 115) to (464, 240).
; PLAN: r0=341(x1), r1=115(y1), r2=464(x2), r3=240(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 115
LDI r2, 464
LDI r3, 240
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
