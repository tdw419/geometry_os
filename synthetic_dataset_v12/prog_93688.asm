; DESCRIPTION: Creates a cyan rectangular region at (212, 64) spanning 87 by 57 pixels.
; PLAN: r0=212(x), r1=64(y), r2=87(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 64
LDI r2, 87
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
