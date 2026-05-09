; DESCRIPTION: Draws a yellow line from (360, 127) to (60, 56).
; PLAN: r0=360(x1), r1=127(y1), r2=60(x2), r3=56(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 127
LDI r2, 60
LDI r3, 56
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
