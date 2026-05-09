; DESCRIPTION: Creates a cyan rectangular region at (270, 97) spanning 107 by 45 pixels.
; PLAN: r0=270(x), r1=97(y), r2=107(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 97
LDI r2, 107
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
