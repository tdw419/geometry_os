; DESCRIPTION: Places a cyan line segment connecting (300, 28) to (103, 115).
; PLAN: r0=300(x1), r1=28(y1), r2=103(x2), r3=115(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 28
LDI r2, 103
LDI r3, 115
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
