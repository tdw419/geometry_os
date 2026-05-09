; DESCRIPTION: Creates a cyan rectangular region at (25, 40) spanning 14 by 90 pixels.
; PLAN: r0=25(x), r1=40(y), r2=14(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 40
LDI r2, 14
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
