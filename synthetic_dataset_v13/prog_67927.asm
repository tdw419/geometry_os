; DESCRIPTION: Creates a white rectangular region at (150, 19) spanning 44 by 67 pixels.
; PLAN: r0=150(x), r1=19(y), r2=44(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 19
LDI r2, 44
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
