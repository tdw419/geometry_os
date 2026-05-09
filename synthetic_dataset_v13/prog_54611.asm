; DESCRIPTION: Creates a cyan rectangular region at (183, 114) spanning 75 by 69 pixels.
; PLAN: r0=183(x), r1=114(y), r2=75(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 114
LDI r2, 75
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
