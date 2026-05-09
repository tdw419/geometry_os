; DESCRIPTION: Places a green line segment connecting (308, 79) to (106, 228).
; PLAN: r0=308(x1), r1=79(y1), r2=106(x2), r3=228(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 79
LDI r2, 106
LDI r3, 228
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
