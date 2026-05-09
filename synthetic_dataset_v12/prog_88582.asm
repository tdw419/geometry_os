; DESCRIPTION: Places a yellow line segment connecting (91, 209) to (75, 103).
; PLAN: r0=91(x1), r1=209(y1), r2=75(x2), r3=103(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 209
LDI r2, 75
LDI r3, 103
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
