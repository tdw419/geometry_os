; DESCRIPTION: Places a green line segment connecting (255, 41) to (151, 103).
; PLAN: r0=255(x1), r1=41(y1), r2=151(x2), r3=103(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 41
LDI r2, 151
LDI r3, 103
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
