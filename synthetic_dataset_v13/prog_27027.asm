; DESCRIPTION: Places a cyan line segment connecting (107, 118) to (487, 53).
; PLAN: r0=107(x1), r1=118(y1), r2=487(x2), r3=53(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 118
LDI r2, 487
LDI r3, 53
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
