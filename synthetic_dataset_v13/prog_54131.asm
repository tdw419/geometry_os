; DESCRIPTION: Creates a cyan rectangular region at (418, 123) spanning 65 by 62 pixels.
; PLAN: r0=418(x), r1=123(y), r2=65(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 123
LDI r2, 65
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
