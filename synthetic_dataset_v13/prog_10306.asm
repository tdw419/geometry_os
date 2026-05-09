; DESCRIPTION: Creates a white rectangular region at (415, 124) spanning 86 by 10 pixels.
; PLAN: r0=415(x), r1=124(y), r2=86(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 124
LDI r2, 86
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
