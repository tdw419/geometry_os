; DESCRIPTION: Draws a yellow line from (111, 16) to (465, 31).
; PLAN: r0=111(x1), r1=16(y1), r2=465(x2), r3=31(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 16
LDI r2, 465
LDI r3, 31
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
