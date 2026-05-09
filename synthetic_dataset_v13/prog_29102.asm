; DESCRIPTION: Places a yellow line segment connecting (165, 45) to (120, 55).
; PLAN: r0=165(x1), r1=45(y1), r2=120(x2), r3=55(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 45
LDI r2, 120
LDI r3, 55
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
