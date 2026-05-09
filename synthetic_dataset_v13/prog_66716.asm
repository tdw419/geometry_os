; DESCRIPTION: Creates a cyan rectangular region at (56, 113) spanning 86 by 87 pixels.
; PLAN: r0=56(x), r1=113(y), r2=86(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 113
LDI r2, 86
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
