; DESCRIPTION: Creates a white rectangular region at (440, 173) spanning 67 by 39 pixels.
; PLAN: r0=440(x), r1=173(y), r2=67(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 173
LDI r2, 67
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
