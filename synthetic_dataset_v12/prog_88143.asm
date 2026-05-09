; DESCRIPTION: Creates a cyan rectangular region at (138, 91) spanning 114 by 45 pixels.
; PLAN: r0=138(x), r1=91(y), r2=114(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 91
LDI r2, 114
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
