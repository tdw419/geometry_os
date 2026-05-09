; DESCRIPTION: Creates a green rectangular region at (168, 85) spanning 52 by 119 pixels.
; PLAN: r0=168(x), r1=85(y), r2=52(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 85
LDI r2, 52
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
