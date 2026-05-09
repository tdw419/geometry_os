; DESCRIPTION: Creates a blue rectangular region at (231, 103) spanning 56 by 116 pixels.
; PLAN: r0=231(x), r1=103(y), r2=56(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 103
LDI r2, 56
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
