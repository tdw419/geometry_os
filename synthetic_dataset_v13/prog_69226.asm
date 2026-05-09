; DESCRIPTION: Creates a red rectangular region at (245, 113) spanning 105 by 86 pixels.
; PLAN: r0=245(x), r1=113(y), r2=105(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 113
LDI r2, 105
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
