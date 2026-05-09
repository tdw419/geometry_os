; DESCRIPTION: Creates a cyan rectangular region at (178, 29) spanning 57 by 58 pixels.
; PLAN: r0=178(x), r1=29(y), r2=57(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 29
LDI r2, 57
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
