; DESCRIPTION: Creates a white rectangular region at (459, 196) spanning 22 by 24 pixels.
; PLAN: r0=459(x), r1=196(y), r2=22(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 196
LDI r2, 22
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
