; DESCRIPTION: Places a white line segment connecting (253, 162) to (392, 220).
; PLAN: r0=253(x1), r1=162(y1), r2=392(x2), r3=220(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 162
LDI r2, 392
LDI r3, 220
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
