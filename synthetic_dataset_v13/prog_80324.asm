; DESCRIPTION: Places a green line segment connecting (167, 5) to (103, 74).
; PLAN: r0=167(x1), r1=5(y1), r2=103(x2), r3=74(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 5
LDI r2, 103
LDI r3, 74
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
