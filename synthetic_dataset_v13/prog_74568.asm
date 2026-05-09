; DESCRIPTION: Draws a yellow line from (240, 116) to (68, 24).
; PLAN: r0=240(x1), r1=116(y1), r2=68(x2), r3=24(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 116
LDI r2, 68
LDI r3, 24
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
