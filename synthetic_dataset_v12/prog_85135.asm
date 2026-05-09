; DESCRIPTION: Places a black line segment connecting (312, 50) to (117, 113).
; PLAN: r0=312(x1), r1=50(y1), r2=117(x2), r3=113(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 50
LDI r2, 117
LDI r3, 113
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
