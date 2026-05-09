; DESCRIPTION: Places a yellow line segment connecting (393, 72) to (12, 164).
; PLAN: r0=393(x1), r1=72(y1), r2=12(x2), r3=164(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 72
LDI r2, 12
LDI r3, 164
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
