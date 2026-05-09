; DESCRIPTION: Places a yellow line segment connecting (254, 182) to (243, 126).
; PLAN: r0=254(x1), r1=182(y1), r2=243(x2), r3=126(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 182
LDI r2, 243
LDI r3, 126
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
