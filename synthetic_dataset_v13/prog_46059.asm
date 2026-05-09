; DESCRIPTION: Draws a yellow line from (127, 58) to (209, 187).
; PLAN: r0=127(x1), r1=58(y1), r2=209(x2), r3=187(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 58
LDI r2, 209
LDI r3, 187
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
