; DESCRIPTION: Draws a green line from (171, 3) to (455, 102).
; PLAN: r0=171(x1), r1=3(y1), r2=455(x2), r3=102(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 3
LDI r2, 455
LDI r3, 102
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
