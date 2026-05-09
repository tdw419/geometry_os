; DESCRIPTION: Creates a cyan rectangular region at (287, 176) spanning 78 by 33 pixels.
; PLAN: r0=287(x), r1=176(y), r2=78(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 176
LDI r2, 78
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
