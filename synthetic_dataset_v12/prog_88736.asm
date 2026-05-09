; DESCRIPTION: Places a white line segment connecting (73, 228) to (30, 156).
; PLAN: r0=73(x1), r1=228(y1), r2=30(x2), r3=156(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 228
LDI r2, 30
LDI r3, 156
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
