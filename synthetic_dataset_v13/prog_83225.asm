; DESCRIPTION: Creates a white rectangular region at (120, 132) spanning 21 by 64 pixels.
; PLAN: r0=120(x), r1=132(y), r2=21(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 132
LDI r2, 21
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
