; DESCRIPTION: Places a white line segment connecting (46, 43) to (238, 246).
; PLAN: r0=46(x1), r1=43(y1), r2=238(x2), r3=246(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 43
LDI r2, 238
LDI r3, 246
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
