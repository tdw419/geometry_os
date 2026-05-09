; DESCRIPTION: Creates a cyan rectangular region at (166, 64) spanning 46 by 57 pixels.
; PLAN: r0=166(x), r1=64(y), r2=46(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 64
LDI r2, 46
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
