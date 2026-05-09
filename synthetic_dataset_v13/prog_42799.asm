; DESCRIPTION: Places a cyan line segment connecting (425, 29) to (277, 201).
; PLAN: r0=425(x1), r1=29(y1), r2=277(x2), r3=201(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 29
LDI r2, 277
LDI r3, 201
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
