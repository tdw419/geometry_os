; DESCRIPTION: Creates a white rectangular region at (386, 73) spanning 116 by 116 pixels.
; PLAN: r0=386(x), r1=73(y), r2=116(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 73
LDI r2, 116
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
