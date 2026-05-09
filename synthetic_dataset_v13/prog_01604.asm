; DESCRIPTION: Creates a white rectangular region at (181, 134) spanning 16 by 119 pixels.
; PLAN: r0=181(x), r1=134(y), r2=16(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 134
LDI r2, 16
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
