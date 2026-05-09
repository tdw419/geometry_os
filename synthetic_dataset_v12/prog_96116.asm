; DESCRIPTION: Creates a cyan rectangular region at (305, 100) spanning 108 by 62 pixels.
; PLAN: r0=305(x), r1=100(y), r2=108(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 100
LDI r2, 108
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
