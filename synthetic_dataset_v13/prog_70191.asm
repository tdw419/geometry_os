; DESCRIPTION: Creates a white rectangular region at (176, 173) spanning 78 by 55 pixels.
; PLAN: r0=176(x), r1=173(y), r2=78(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 173
LDI r2, 78
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
