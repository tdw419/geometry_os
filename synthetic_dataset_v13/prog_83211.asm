; DESCRIPTION: Creates a cyan rectangular region at (128, 114) spanning 55 by 86 pixels.
; PLAN: r0=128(x), r1=114(y), r2=55(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 114
LDI r2, 55
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
