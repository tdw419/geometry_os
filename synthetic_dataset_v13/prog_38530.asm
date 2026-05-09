; DESCRIPTION: Places a white line segment connecting (18, 73) to (117, 208).
; PLAN: r0=18(x1), r1=73(y1), r2=117(x2), r3=208(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 73
LDI r2, 117
LDI r3, 208
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
