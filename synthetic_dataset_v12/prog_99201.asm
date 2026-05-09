; DESCRIPTION: Creates a white rectangular region at (284, 119) spanning 56 by 61 pixels.
; PLAN: r0=284(x), r1=119(y), r2=56(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 119
LDI r2, 56
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
