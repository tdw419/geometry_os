; DESCRIPTION: Creates a white rectangular region at (63, 116) spanning 39 by 36 pixels.
; PLAN: r0=63(x), r1=116(y), r2=39(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 116
LDI r2, 39
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
