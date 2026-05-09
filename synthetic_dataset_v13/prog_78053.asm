; DESCRIPTION: Creates a cyan rectangular region at (279, 43) spanning 15 by 115 pixels.
; PLAN: r0=279(x), r1=43(y), r2=15(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 43
LDI r2, 15
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
