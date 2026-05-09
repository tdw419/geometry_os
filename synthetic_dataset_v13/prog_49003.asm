; DESCRIPTION: Creates a red rectangular region at (23, 56) spanning 113 by 112 pixels.
; PLAN: r0=23(x), r1=56(y), r2=113(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 56
LDI r2, 113
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
