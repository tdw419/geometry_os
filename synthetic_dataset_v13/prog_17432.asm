; DESCRIPTION: Draws a green line from (496, 186) to (291, 134).
; PLAN: r0=496(x1), r1=186(y1), r2=291(x2), r3=134(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 186
LDI r2, 291
LDI r3, 134
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
