; DESCRIPTION: Creates a white rectangular region at (25, 209) spanning 100 by 16 pixels.
; PLAN: r0=25(x), r1=209(y), r2=100(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 209
LDI r2, 100
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
