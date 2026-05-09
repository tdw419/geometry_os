; DESCRIPTION: Draws a yellow line from (202, 249) to (58, 202).
; PLAN: r0=202(x1), r1=249(y1), r2=58(x2), r3=202(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 249
LDI r2, 58
LDI r3, 202
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
