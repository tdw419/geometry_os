; DESCRIPTION: Creates a white rectangular region at (209, 56) spanning 82 by 92 pixels.
; PLAN: r0=209(x), r1=56(y), r2=82(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 56
LDI r2, 82
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
