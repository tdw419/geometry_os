; DESCRIPTION: Creates a cyan rectangular region at (43, 82) spanning 115 by 114 pixels.
; PLAN: r0=43(x), r1=82(y), r2=115(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 82
LDI r2, 115
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
