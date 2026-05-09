; DESCRIPTION: Creates a white rectangular region at (69, 98) spanning 83 by 16 pixels.
; PLAN: r0=69(x), r1=98(y), r2=83(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 98
LDI r2, 83
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
