; DESCRIPTION: Creates a white rectangular region at (189, 49) spanning 16 by 60 pixels.
; PLAN: r0=189(x), r1=49(y), r2=16(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 49
LDI r2, 16
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
