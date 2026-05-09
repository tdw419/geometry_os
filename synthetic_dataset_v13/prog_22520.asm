; DESCRIPTION: Creates a green rectangular region at (200, 126) spanning 120 by 93 pixels.
; PLAN: r0=200(x), r1=126(y), r2=120(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 126
LDI r2, 120
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
