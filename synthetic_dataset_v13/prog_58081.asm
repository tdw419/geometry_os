; DESCRIPTION: Creates a cyan rectangular region at (338, 159) spanning 37 by 49 pixels.
; PLAN: r0=338(x), r1=159(y), r2=37(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 159
LDI r2, 37
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
