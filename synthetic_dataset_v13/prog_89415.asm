; DESCRIPTION: Creates a green rectangular region at (86, 2) spanning 72 by 120 pixels.
; PLAN: r0=86(x), r1=2(y), r2=72(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 2
LDI r2, 72
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
