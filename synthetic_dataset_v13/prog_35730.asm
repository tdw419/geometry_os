; DESCRIPTION: Creates a white rectangular region at (415, 76) spanning 64 by 59 pixels.
; PLAN: r0=415(x), r1=76(y), r2=64(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 76
LDI r2, 64
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
