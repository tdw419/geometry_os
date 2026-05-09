; DESCRIPTION: Creates a cyan rectangular region at (58, 83) spanning 69 by 57 pixels.
; PLAN: r0=58(x), r1=83(y), r2=69(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 83
LDI r2, 69
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
