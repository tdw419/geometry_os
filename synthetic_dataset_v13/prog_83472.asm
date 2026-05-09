; DESCRIPTION: Places a white line segment connecting (437, 173) to (204, 246).
; PLAN: r0=437(x1), r1=173(y1), r2=204(x2), r3=246(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 173
LDI r2, 204
LDI r3, 246
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
