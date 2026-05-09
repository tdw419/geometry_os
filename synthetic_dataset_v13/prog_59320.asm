; DESCRIPTION: Creates a cyan rectangular region at (310, 39) spanning 89 by 93 pixels.
; PLAN: r0=310(x), r1=39(y), r2=89(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 39
LDI r2, 89
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
