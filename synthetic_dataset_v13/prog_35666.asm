; DESCRIPTION: Places a white line segment connecting (433, 54) to (69, 6).
; PLAN: r0=433(x1), r1=54(y1), r2=69(x2), r3=6(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 54
LDI r2, 69
LDI r3, 6
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
