; DESCRIPTION: Creates a white rectangular region at (23, 80) spanning 28 by 67 pixels.
; PLAN: r0=23(x), r1=80(y), r2=28(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 80
LDI r2, 28
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
