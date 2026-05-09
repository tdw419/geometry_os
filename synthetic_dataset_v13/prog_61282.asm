; DESCRIPTION: Places a black line segment connecting (186, 60) to (354, 207).
; PLAN: r0=186(x1), r1=60(y1), r2=354(x2), r3=207(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 60
LDI r2, 354
LDI r3, 207
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
