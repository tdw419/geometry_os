; DESCRIPTION: Creates a white rectangular region at (204, 17) spanning 86 by 27 pixels.
; PLAN: r0=204(x), r1=17(y), r2=86(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 17
LDI r2, 86
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
