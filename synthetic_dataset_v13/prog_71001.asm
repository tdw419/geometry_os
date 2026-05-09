; DESCRIPTION: Creates a white rectangular region at (474, 42) spanning 22 by 106 pixels.
; PLAN: r0=474(x), r1=42(y), r2=22(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 42
LDI r2, 22
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
