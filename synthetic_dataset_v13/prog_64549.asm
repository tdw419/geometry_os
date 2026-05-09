; DESCRIPTION: Creates a white rectangular region at (434, 173) spanning 12 by 14 pixels.
; PLAN: r0=434(x), r1=173(y), r2=12(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 173
LDI r2, 12
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
