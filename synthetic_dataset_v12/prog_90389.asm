; DESCRIPTION: Creates a cyan rectangular region at (128, 87) spanning 78 by 107 pixels.
; PLAN: r0=128(x), r1=87(y), r2=78(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 87
LDI r2, 78
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
