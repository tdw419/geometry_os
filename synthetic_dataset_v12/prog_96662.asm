; DESCRIPTION: Draws a yellow line from (264, 9) to (33, 115).
; PLAN: r0=264(x1), r1=9(y1), r2=33(x2), r3=115(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 9
LDI r2, 33
LDI r3, 115
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
