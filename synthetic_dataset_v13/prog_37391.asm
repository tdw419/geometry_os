; DESCRIPTION: Places a yellow line segment connecting (167, 27) to (7, 236).
; PLAN: r0=167(x1), r1=27(y1), r2=7(x2), r3=236(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 27
LDI r2, 7
LDI r3, 236
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
