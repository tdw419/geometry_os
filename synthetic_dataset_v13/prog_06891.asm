; DESCRIPTION: Creates a cyan rectangular region at (154, 83) spanning 34 by 94 pixels.
; PLAN: r0=154(x), r1=83(y), r2=34(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 83
LDI r2, 34
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
