; DESCRIPTION: Creates a white rectangular region at (356, 130) spanning 87 by 26 pixels.
; PLAN: r0=356(x), r1=130(y), r2=87(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 130
LDI r2, 87
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
