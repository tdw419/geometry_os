; DESCRIPTION: Creates a cyan rectangular region at (333, 73) spanning 56 by 78 pixels.
; PLAN: r0=333(x), r1=73(y), r2=56(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 73
LDI r2, 56
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
