; DESCRIPTION: Draws a yellow line from (446, 140) to (60, 249).
; PLAN: r0=446(x1), r1=140(y1), r2=60(x2), r3=249(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 140
LDI r2, 60
LDI r3, 249
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
