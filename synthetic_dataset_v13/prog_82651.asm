; DESCRIPTION: Places a white line segment connecting (380, 228) to (37, 24).
; PLAN: r0=380(x1), r1=228(y1), r2=37(x2), r3=24(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 228
LDI r2, 37
LDI r3, 24
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
