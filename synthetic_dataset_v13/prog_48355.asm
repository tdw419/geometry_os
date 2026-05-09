; DESCRIPTION: Creates a green rectangular region at (450, 4) spanning 52 by 93 pixels.
; PLAN: r0=450(x), r1=4(y), r2=52(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 4
LDI r2, 52
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
