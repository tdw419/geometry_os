; DESCRIPTION: Creates a white rectangular region at (0, 44) spanning 30 by 113 pixels.
; PLAN: r0=0(x), r1=44(y), r2=30(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 44
LDI r2, 30
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
