; DESCRIPTION: Creates a cyan rectangular region at (114, 206) spanning 78 by 30 pixels.
; PLAN: r0=114(x), r1=206(y), r2=78(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 206
LDI r2, 78
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
