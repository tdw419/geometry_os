; DESCRIPTION: Creates a cyan rectangular region at (492, 74) spanning 20 by 102 pixels.
; PLAN: r0=492(x), r1=74(y), r2=20(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 74
LDI r2, 20
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
