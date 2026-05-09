; DESCRIPTION: Creates a white rectangular region at (172, 13) spanning 113 by 120 pixels.
; PLAN: r0=172(x), r1=13(y), r2=113(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 13
LDI r2, 113
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
