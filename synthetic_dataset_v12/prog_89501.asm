; DESCRIPTION: Places a red line segment connecting (261, 125) to (456, 117).
; PLAN: r0=261(x1), r1=125(y1), r2=456(x2), r3=117(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 125
LDI r2, 456
LDI r3, 117
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
