; DESCRIPTION: Creates a white rectangular region at (36, 196) spanning 96 by 37 pixels.
; PLAN: r0=36(x), r1=196(y), r2=96(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 196
LDI r2, 96
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
