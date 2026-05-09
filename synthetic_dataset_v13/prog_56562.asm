; DESCRIPTION: Creates a green rectangular region at (408, 183) spanning 67 by 15 pixels.
; PLAN: r0=408(x), r1=183(y), r2=67(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 183
LDI r2, 67
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
