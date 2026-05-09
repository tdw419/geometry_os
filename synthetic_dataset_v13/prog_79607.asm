; DESCRIPTION: Creates a cyan rectangular region at (430, 199) spanning 26 by 14 pixels.
; PLAN: r0=430(x), r1=199(y), r2=26(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 199
LDI r2, 26
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
