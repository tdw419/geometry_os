; DESCRIPTION: Creates a white rectangular region at (86, 112) spanning 39 by 38 pixels.
; PLAN: r0=86(x), r1=112(y), r2=39(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 112
LDI r2, 39
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
