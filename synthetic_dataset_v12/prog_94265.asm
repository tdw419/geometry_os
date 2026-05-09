; DESCRIPTION: Creates a cyan rectangular region at (231, 105) spanning 10 by 64 pixels.
; PLAN: r0=231(x), r1=105(y), r2=10(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 105
LDI r2, 10
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
