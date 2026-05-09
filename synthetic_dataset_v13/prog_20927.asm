; DESCRIPTION: Creates a white rectangular region at (203, 48) spanning 86 by 103 pixels.
; PLAN: r0=203(x), r1=48(y), r2=86(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 48
LDI r2, 86
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
