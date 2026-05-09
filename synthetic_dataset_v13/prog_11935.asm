; DESCRIPTION: Creates a cyan rectangular region at (128, 184) spanning 76 by 67 pixels.
; PLAN: r0=128(x), r1=184(y), r2=76(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 184
LDI r2, 76
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
