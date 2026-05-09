; DESCRIPTION: Places a white line segment connecting (50, 165) to (116, 173).
; PLAN: r0=50(x1), r1=165(y1), r2=116(x2), r3=173(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 165
LDI r2, 116
LDI r3, 173
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
