; DESCRIPTION: Places a green line segment connecting (114, 181) to (336, 27).
; PLAN: r0=114(x1), r1=181(y1), r2=336(x2), r3=27(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 181
LDI r2, 336
LDI r3, 27
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
