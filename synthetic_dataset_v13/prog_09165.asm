; DESCRIPTION: Places a yellow line segment connecting (445, 227) to (328, 42).
; PLAN: r0=445(x1), r1=227(y1), r2=328(x2), r3=42(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 227
LDI r2, 328
LDI r3, 42
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
