; DESCRIPTION: Creates a cyan rectangular region at (211, 21) spanning 64 by 99 pixels.
; PLAN: r0=211(x), r1=21(y), r2=64(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 21
LDI r2, 64
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
