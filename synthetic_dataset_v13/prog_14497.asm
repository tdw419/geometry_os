; DESCRIPTION: Creates a cyan rectangular region at (122, 26) spanning 32 by 63 pixels.
; PLAN: r0=122(x), r1=26(y), r2=32(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 26
LDI r2, 32
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
