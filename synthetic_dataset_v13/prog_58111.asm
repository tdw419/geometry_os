; DESCRIPTION: Draws a yellow line from (139, 0) to (178, 113).
; PLAN: r0=139(x1), r1=0(y1), r2=178(x2), r3=113(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 0
LDI r2, 178
LDI r3, 113
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
