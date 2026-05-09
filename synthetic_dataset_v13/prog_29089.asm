; DESCRIPTION: Creates a cyan rectangular region at (72, 151) spanning 62 by 47 pixels.
; PLAN: r0=72(x), r1=151(y), r2=62(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 151
LDI r2, 62
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
