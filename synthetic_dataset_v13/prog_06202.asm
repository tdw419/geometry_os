; DESCRIPTION: Creates a cyan rectangular region at (183, 69) spanning 113 by 44 pixels.
; PLAN: r0=183(x), r1=69(y), r2=113(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 69
LDI r2, 113
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
