; DESCRIPTION: Creates a cyan rectangular region at (187, 35) spanning 37 by 113 pixels.
; PLAN: r0=187(x), r1=35(y), r2=37(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 35
LDI r2, 37
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
