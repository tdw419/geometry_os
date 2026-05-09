; DESCRIPTION: Places a white line segment connecting (392, 66) to (154, 28).
; PLAN: r0=392(x1), r1=66(y1), r2=154(x2), r3=28(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 66
LDI r2, 154
LDI r3, 28
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
