; DESCRIPTION: Draws a yellow line from (413, 59) to (160, 251).
; PLAN: r0=413(x1), r1=59(y1), r2=160(x2), r3=251(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 59
LDI r2, 160
LDI r3, 251
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
