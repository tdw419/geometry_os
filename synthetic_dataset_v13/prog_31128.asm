; DESCRIPTION: Creates a white rectangular region at (393, 42) spanning 99 by 69 pixels.
; PLAN: r0=393(x), r1=42(y), r2=99(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 42
LDI r2, 99
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
