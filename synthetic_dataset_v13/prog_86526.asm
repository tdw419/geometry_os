; DESCRIPTION: Draws a yellow line from (90, 28) to (33, 16).
; PLAN: r0=90(x1), r1=28(y1), r2=33(x2), r3=16(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 28
LDI r2, 33
LDI r3, 16
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
