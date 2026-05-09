; DESCRIPTION: Creates a white rectangular region at (173, 98) spanning 58 by 58 pixels.
; PLAN: r0=173(x), r1=98(y), r2=58(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 98
LDI r2, 58
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
