; DESCRIPTION: Places a white line segment connecting (199, 228) to (408, 51).
; PLAN: r0=199(x1), r1=228(y1), r2=408(x2), r3=51(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 228
LDI r2, 408
LDI r3, 51
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
