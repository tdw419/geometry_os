; DESCRIPTION: Creates a white rectangular region at (113, 161) spanning 76 by 32 pixels.
; PLAN: r0=113(x), r1=161(y), r2=76(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 161
LDI r2, 76
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
