; DESCRIPTION: Creates a white rectangular region at (435, 196) spanning 14 by 10 pixels.
; PLAN: r0=435(x), r1=196(y), r2=14(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 196
LDI r2, 14
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
