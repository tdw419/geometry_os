; DESCRIPTION: Creates a cyan rectangular region at (226, 138) spanning 76 by 23 pixels.
; PLAN: r0=226(x), r1=138(y), r2=76(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 138
LDI r2, 76
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
