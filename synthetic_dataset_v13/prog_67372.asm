; DESCRIPTION: Places a white line segment connecting (368, 166) to (290, 127).
; PLAN: r0=368(x1), r1=166(y1), r2=290(x2), r3=127(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 166
LDI r2, 290
LDI r3, 127
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
