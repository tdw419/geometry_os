; DESCRIPTION: Creates a white rectangular region at (192, 72) spanning 103 by 33 pixels.
; PLAN: r0=192(x), r1=72(y), r2=103(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 72
LDI r2, 103
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
