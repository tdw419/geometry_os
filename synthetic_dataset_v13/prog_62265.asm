; DESCRIPTION: Creates a green rectangular region at (142, 138) spanning 67 by 116 pixels.
; PLAN: r0=142(x), r1=138(y), r2=67(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 138
LDI r2, 67
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
