; DESCRIPTION: Creates a green rectangular region at (56, 116) spanning 86 by 67 pixels.
; PLAN: r0=56(x), r1=116(y), r2=86(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 116
LDI r2, 86
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
