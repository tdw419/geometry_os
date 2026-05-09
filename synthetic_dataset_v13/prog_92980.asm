; DESCRIPTION: Creates a cyan rectangular region at (30, 9) spanning 20 by 62 pixels.
; PLAN: r0=30(x), r1=9(y), r2=20(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 9
LDI r2, 20
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
