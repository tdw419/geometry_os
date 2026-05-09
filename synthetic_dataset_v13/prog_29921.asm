; DESCRIPTION: Creates a cyan rectangular region at (138, 76) spanning 32 by 108 pixels.
; PLAN: r0=138(x), r1=76(y), r2=32(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 76
LDI r2, 32
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
