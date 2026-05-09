; DESCRIPTION: Creates a white rectangular region at (5, 98) spanning 115 by 27 pixels.
; PLAN: r0=5(x), r1=98(y), r2=115(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 98
LDI r2, 115
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
