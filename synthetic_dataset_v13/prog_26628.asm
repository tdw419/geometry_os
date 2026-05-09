; DESCRIPTION: Places a green line segment connecting (335, 228) to (100, 37).
; PLAN: r0=335(x1), r1=228(y1), r2=100(x2), r3=37(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 228
LDI r2, 100
LDI r3, 37
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
