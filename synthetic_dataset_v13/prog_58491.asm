; DESCRIPTION: Places a white line segment connecting (411, 117) to (174, 123).
; PLAN: r0=411(x1), r1=117(y1), r2=174(x2), r3=123(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 117
LDI r2, 174
LDI r3, 123
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
