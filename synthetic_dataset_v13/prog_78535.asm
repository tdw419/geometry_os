; DESCRIPTION: Creates a white rectangular region at (190, 86) spanning 59 by 100 pixels.
; PLAN: r0=190(x), r1=86(y), r2=59(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 86
LDI r2, 59
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
