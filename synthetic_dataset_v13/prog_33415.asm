; DESCRIPTION: Creates a cyan rectangular region at (304, 5) spanning 76 by 69 pixels.
; PLAN: r0=304(x), r1=5(y), r2=76(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 5
LDI r2, 76
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
