; DESCRIPTION: Places a yellow line segment connecting (46, 103) to (187, 62).
; PLAN: r0=46(x1), r1=103(y1), r2=187(x2), r3=62(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 103
LDI r2, 187
LDI r3, 62
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
