; DESCRIPTION: Places a orange line segment connecting (27, 13) to (392, 177).
; PLAN: r0=27(x1), r1=13(y1), r2=392(x2), r3=177(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 13
LDI r2, 392
LDI r3, 177
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
