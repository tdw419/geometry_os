; DESCRIPTION: Creates a cyan rectangular region at (105, 86) spanning 102 by 19 pixels.
; PLAN: r0=105(x), r1=86(y), r2=102(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 86
LDI r2, 102
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
