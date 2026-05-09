; DESCRIPTION: Creates a white rectangular region at (333, 159) spanning 32 by 35 pixels.
; PLAN: r0=333(x), r1=159(y), r2=32(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 159
LDI r2, 32
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
