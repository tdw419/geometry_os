; DESCRIPTION: Creates a green rectangular region at (335, 114) spanning 103 by 32 pixels.
; PLAN: r0=335(x), r1=114(y), r2=103(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 114
LDI r2, 103
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
