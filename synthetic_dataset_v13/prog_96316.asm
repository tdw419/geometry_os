; DESCRIPTION: Creates a cyan rectangular region at (316, 15) spanning 83 by 39 pixels.
; PLAN: r0=316(x), r1=15(y), r2=83(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 15
LDI r2, 83
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
