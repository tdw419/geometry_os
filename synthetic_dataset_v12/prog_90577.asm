; DESCRIPTION: Creates a cyan rectangular region at (240, 78) spanning 86 by 118 pixels.
; PLAN: r0=240(x), r1=78(y), r2=86(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 78
LDI r2, 86
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
