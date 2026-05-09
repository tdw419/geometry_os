; DESCRIPTION: Places a white line segment connecting (168, 115) to (342, 120).
; PLAN: r0=168(x1), r1=115(y1), r2=342(x2), r3=120(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 115
LDI r2, 342
LDI r3, 120
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
