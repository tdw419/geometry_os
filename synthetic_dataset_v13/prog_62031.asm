; DESCRIPTION: Places a green line segment connecting (277, 10) to (392, 185).
; PLAN: r0=277(x1), r1=10(y1), r2=392(x2), r3=185(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 10
LDI r2, 392
LDI r3, 185
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
