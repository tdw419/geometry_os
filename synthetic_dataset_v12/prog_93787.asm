; DESCRIPTION: Creates a cyan rectangular region at (108, 143) spanning 60 by 99 pixels.
; PLAN: r0=108(x), r1=143(y), r2=60(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 143
LDI r2, 60
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
