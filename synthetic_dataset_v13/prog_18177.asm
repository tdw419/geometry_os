; DESCRIPTION: Creates a red rectangular region at (354, 113) spanning 53 by 48 pixels.
; PLAN: r0=354(x), r1=113(y), r2=53(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 113
LDI r2, 53
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
