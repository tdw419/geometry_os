; DESCRIPTION: Creates a cyan rectangular region at (418, 49) spanning 44 by 30 pixels.
; PLAN: r0=418(x), r1=49(y), r2=44(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 49
LDI r2, 44
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
