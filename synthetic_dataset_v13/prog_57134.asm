; DESCRIPTION: Places a white line segment connecting (45, 152) to (219, 198).
; PLAN: r0=45(x1), r1=152(y1), r2=219(x2), r3=198(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 152
LDI r2, 219
LDI r3, 198
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
