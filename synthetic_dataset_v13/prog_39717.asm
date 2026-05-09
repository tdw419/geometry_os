; DESCRIPTION: Places a white line segment connecting (3, 149) to (346, 211).
; PLAN: r0=3(x1), r1=149(y1), r2=346(x2), r3=211(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 149
LDI r2, 346
LDI r3, 211
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
