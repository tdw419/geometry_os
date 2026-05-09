; DESCRIPTION: Creates a green rectangular region at (120, 126) spanning 62 by 48 pixels.
; PLAN: r0=120(x), r1=126(y), r2=62(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 126
LDI r2, 62
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
