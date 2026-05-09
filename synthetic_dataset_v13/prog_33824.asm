; DESCRIPTION: Draws a white line from (300, 75) to (152, 219).
; PLAN: r0=300(x1), r1=75(y1), r2=152(x2), r3=219(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 75
LDI r2, 152
LDI r3, 219
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
