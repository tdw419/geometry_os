; DESCRIPTION: Creates a green rectangular region at (199, 12) spanning 93 by 120 pixels.
; PLAN: r0=199(x), r1=12(y), r2=93(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 12
LDI r2, 93
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
