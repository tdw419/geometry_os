; DESCRIPTION: Creates a cyan rectangular region at (339, 43) spanning 90 by 95 pixels.
; PLAN: r0=339(x), r1=43(y), r2=90(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 43
LDI r2, 90
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
