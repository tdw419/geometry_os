; DESCRIPTION: Creates a white rectangular region at (37, 5) spanning 47 by 113 pixels.
; PLAN: r0=37(x), r1=5(y), r2=47(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 5
LDI r2, 47
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
