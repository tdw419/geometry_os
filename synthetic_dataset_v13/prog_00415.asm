; DESCRIPTION: Creates a cyan rectangular region at (86, 38) spanning 23 by 56 pixels.
; PLAN: r0=86(x), r1=38(y), r2=23(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 38
LDI r2, 23
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
