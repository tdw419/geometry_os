; DESCRIPTION: Creates a cyan rectangular region at (1, 26) spanning 75 by 28 pixels.
; PLAN: r0=1(x), r1=26(y), r2=75(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 26
LDI r2, 75
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
