; DESCRIPTION: Creates a cyan rectangular region at (381, 213) spanning 118 by 43 pixels.
; PLAN: r0=381(x), r1=213(y), r2=118(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 213
LDI r2, 118
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
