; DESCRIPTION: Creates a cyan rectangular region at (339, 64) spanning 40 by 89 pixels.
; PLAN: r0=339(x), r1=64(y), r2=40(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 64
LDI r2, 40
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
