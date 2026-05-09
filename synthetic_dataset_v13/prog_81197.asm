; DESCRIPTION: Places a green line segment connecting (267, 168) to (375, 74).
; PLAN: r0=267(x1), r1=168(y1), r2=375(x2), r3=74(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 168
LDI r2, 375
LDI r3, 74
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
