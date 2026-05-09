; DESCRIPTION: Creates a cyan rectangular region at (84, 10) spanning 38 by 62 pixels.
; PLAN: r0=84(x), r1=10(y), r2=38(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 10
LDI r2, 38
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
