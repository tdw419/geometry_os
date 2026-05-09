; DESCRIPTION: Draws a yellow line from (175, 120) to (263, 88).
; PLAN: r0=175(x1), r1=120(y1), r2=263(x2), r3=88(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 120
LDI r2, 263
LDI r3, 88
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
