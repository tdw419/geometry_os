; DESCRIPTION: Creates a white rectangular region at (251, 27) spanning 39 by 86 pixels.
; PLAN: r0=251(x), r1=27(y), r2=39(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 27
LDI r2, 39
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
