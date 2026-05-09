; DESCRIPTION: Places a white line segment connecting (229, 199) to (85, 228).
; PLAN: r0=229(x1), r1=199(y1), r2=85(x2), r3=228(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 199
LDI r2, 85
LDI r3, 228
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
