; DESCRIPTION: Places a yellow line segment connecting (167, 194) to (333, 166).
; PLAN: r0=167(x1), r1=194(y1), r2=333(x2), r3=166(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 194
LDI r2, 333
LDI r3, 166
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
