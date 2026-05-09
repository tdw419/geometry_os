; DESCRIPTION: Places a white line segment connecting (430, 21) to (392, 68).
; PLAN: r0=430(x1), r1=21(y1), r2=392(x2), r3=68(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 21
LDI r2, 392
LDI r3, 68
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
