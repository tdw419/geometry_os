; DESCRIPTION: Creates a white rectangular region at (172, 114) spanning 19 by 59 pixels.
; PLAN: r0=172(x), r1=114(y), r2=19(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 114
LDI r2, 19
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
