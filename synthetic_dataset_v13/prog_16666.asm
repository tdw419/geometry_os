; DESCRIPTION: Places a green line segment connecting (407, 228) to (276, 12).
; PLAN: r0=407(x1), r1=228(y1), r2=276(x2), r3=12(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 228
LDI r2, 276
LDI r3, 12
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
