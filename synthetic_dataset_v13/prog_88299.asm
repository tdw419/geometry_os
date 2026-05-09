; DESCRIPTION: Creates a white rectangular region at (145, 213) spanning 62 by 24 pixels.
; PLAN: r0=145(x), r1=213(y), r2=62(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 213
LDI r2, 62
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
