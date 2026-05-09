; DESCRIPTION: Places a white line segment connecting (220, 55) to (152, 47).
; PLAN: r0=220(x1), r1=55(y1), r2=152(x2), r3=47(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 55
LDI r2, 152
LDI r3, 47
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
