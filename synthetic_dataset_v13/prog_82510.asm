; DESCRIPTION: Places a white line segment connecting (69, 246) to (294, 208).
; PLAN: r0=69(x1), r1=246(y1), r2=294(x2), r3=208(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 246
LDI r2, 294
LDI r3, 208
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
