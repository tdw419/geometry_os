; DESCRIPTION: Places a yellow line segment connecting (75, 151) to (263, 166).
; PLAN: r0=75(x1), r1=151(y1), r2=263(x2), r3=166(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 151
LDI r2, 263
LDI r3, 166
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
