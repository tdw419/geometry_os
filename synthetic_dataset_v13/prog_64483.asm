; DESCRIPTION: Creates a cyan rectangular region at (108, 8) spanning 32 by 43 pixels.
; PLAN: r0=108(x), r1=8(y), r2=32(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 8
LDI r2, 32
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
