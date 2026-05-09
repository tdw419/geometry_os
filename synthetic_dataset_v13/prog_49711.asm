; DESCRIPTION: Creates a cyan rectangular region at (138, 9) spanning 83 by 86 pixels.
; PLAN: r0=138(x), r1=9(y), r2=83(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 9
LDI r2, 83
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
