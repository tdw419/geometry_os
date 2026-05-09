; DESCRIPTION: Places a white line segment connecting (182, 225) to (125, 207).
; PLAN: r0=182(x1), r1=225(y1), r2=125(x2), r3=207(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 225
LDI r2, 125
LDI r3, 207
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
