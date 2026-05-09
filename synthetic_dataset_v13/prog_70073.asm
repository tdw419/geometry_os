; DESCRIPTION: Creates a white rectangular region at (192, 54) spanning 27 by 53 pixels.
; PLAN: r0=192(x), r1=54(y), r2=27(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 54
LDI r2, 27
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
