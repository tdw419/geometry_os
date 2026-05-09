; DESCRIPTION: Creates a white rectangular region at (82, 16) spanning 37 by 100 pixels.
; PLAN: r0=82(x), r1=16(y), r2=37(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 16
LDI r2, 37
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
