; DESCRIPTION: Draws a yellow line from (108, 230) to (42, 118).
; PLAN: r0=108(x1), r1=230(y1), r2=42(x2), r3=118(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 230
LDI r2, 42
LDI r3, 118
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
