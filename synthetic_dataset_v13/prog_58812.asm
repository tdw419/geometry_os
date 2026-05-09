; DESCRIPTION: Creates a cyan rectangular region at (61, 101) spanning 44 by 113 pixels.
; PLAN: r0=61(x), r1=101(y), r2=44(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 101
LDI r2, 44
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
