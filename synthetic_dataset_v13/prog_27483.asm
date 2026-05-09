; DESCRIPTION: Places a green line segment connecting (53, 120) to (382, 95).
; PLAN: r0=53(x1), r1=120(y1), r2=382(x2), r3=95(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 120
LDI r2, 382
LDI r3, 95
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
