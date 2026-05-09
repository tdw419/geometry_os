; DESCRIPTION: Creates a green rectangular region at (376, 114) spanning 86 by 70 pixels.
; PLAN: r0=376(x), r1=114(y), r2=86(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 114
LDI r2, 86
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
