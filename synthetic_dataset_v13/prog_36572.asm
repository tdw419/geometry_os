; DESCRIPTION: Creates a white rectangular region at (196, 203) spanning 39 by 32 pixels.
; PLAN: r0=196(x), r1=203(y), r2=39(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 203
LDI r2, 39
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
