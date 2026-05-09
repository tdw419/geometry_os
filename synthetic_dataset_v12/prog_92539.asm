; DESCRIPTION: Places a yellow line segment connecting (63, 149) to (445, 20).
; PLAN: r0=63(x1), r1=149(y1), r2=445(x2), r3=20(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 149
LDI r2, 445
LDI r3, 20
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
