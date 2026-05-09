; DESCRIPTION: Creates a cyan rectangular region at (131, 34) spanning 93 by 84 pixels.
; PLAN: r0=131(x), r1=34(y), r2=93(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 34
LDI r2, 93
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
