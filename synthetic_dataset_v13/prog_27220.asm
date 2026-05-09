; DESCRIPTION: Creates a cyan rectangular region at (53, 143) spanning 114 by 80 pixels.
; PLAN: r0=53(x), r1=143(y), r2=114(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 143
LDI r2, 114
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
