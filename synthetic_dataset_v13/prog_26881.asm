; DESCRIPTION: Places a green line segment connecting (276, 228) to (154, 72).
; PLAN: r0=276(x1), r1=228(y1), r2=154(x2), r3=72(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 228
LDI r2, 154
LDI r3, 72
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
