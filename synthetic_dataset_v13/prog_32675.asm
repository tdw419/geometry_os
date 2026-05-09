; DESCRIPTION: Creates a cyan rectangular region at (304, 3) spanning 58 by 31 pixels.
; PLAN: r0=304(x), r1=3(y), r2=58(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 3
LDI r2, 58
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
