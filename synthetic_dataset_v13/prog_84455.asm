; DESCRIPTION: Places a green line segment connecting (213, 60) to (25, 6).
; PLAN: r0=213(x1), r1=60(y1), r2=25(x2), r3=6(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 60
LDI r2, 25
LDI r3, 6
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
