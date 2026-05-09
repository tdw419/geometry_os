; DESCRIPTION: Creates a white rectangular region at (43, 208) spanning 64 by 34 pixels.
; PLAN: r0=43(x), r1=208(y), r2=64(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 208
LDI r2, 64
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
