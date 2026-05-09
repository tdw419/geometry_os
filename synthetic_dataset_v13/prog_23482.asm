; DESCRIPTION: Creates a cyan rectangular region at (156, 135) spanning 69 by 15 pixels.
; PLAN: r0=156(x), r1=135(y), r2=69(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 135
LDI r2, 69
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
