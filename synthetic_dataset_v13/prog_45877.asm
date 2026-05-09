; DESCRIPTION: Creates a green rectangular region at (199, 85) spanning 93 by 89 pixels.
; PLAN: r0=199(x), r1=85(y), r2=93(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 85
LDI r2, 93
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
