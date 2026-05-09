; DESCRIPTION: Creates a cyan rectangular region at (66, 138) spanning 12 by 98 pixels.
; PLAN: r0=66(x), r1=138(y), r2=12(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 138
LDI r2, 12
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
