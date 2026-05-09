; DESCRIPTION: Creates a cyan rectangular region at (349, 27) spanning 62 by 53 pixels.
; PLAN: r0=349(x), r1=27(y), r2=62(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 27
LDI r2, 62
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
