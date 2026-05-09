; DESCRIPTION: Draws a yellow line from (505, 15) to (269, 221).
; PLAN: r0=505(x1), r1=15(y1), r2=269(x2), r3=221(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 15
LDI r2, 269
LDI r3, 221
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
