; DESCRIPTION: Creates a white rectangular region at (299, 120) spanning 87 by 67 pixels.
; PLAN: r0=299(x), r1=120(y), r2=87(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 120
LDI r2, 87
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
