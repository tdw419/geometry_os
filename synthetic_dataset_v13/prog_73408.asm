; DESCRIPTION: Places a white line segment connecting (280, 234) to (95, 48).
; PLAN: r0=280(x1), r1=234(y1), r2=95(x2), r3=48(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 234
LDI r2, 95
LDI r3, 48
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
