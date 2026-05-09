; DESCRIPTION: Creates a cyan rectangular region at (205, 148) spanning 30 by 82 pixels.
; PLAN: r0=205(x), r1=148(y), r2=30(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 148
LDI r2, 30
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
