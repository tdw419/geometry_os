; DESCRIPTION: Draws a yellow line from (220, 59) to (107, 8).
; PLAN: r0=220(x1), r1=59(y1), r2=107(x2), r3=8(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 59
LDI r2, 107
LDI r3, 8
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
