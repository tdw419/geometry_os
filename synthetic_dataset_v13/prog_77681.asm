; DESCRIPTION: Creates a cyan rectangular region at (102, 76) spanning 62 by 95 pixels.
; PLAN: r0=102(x), r1=76(y), r2=62(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 76
LDI r2, 62
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
