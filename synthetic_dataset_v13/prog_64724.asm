; DESCRIPTION: Places a yellow line segment connecting (281, 52) to (69, 6).
; PLAN: r0=281(x1), r1=52(y1), r2=69(x2), r3=6(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 52
LDI r2, 69
LDI r3, 6
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
