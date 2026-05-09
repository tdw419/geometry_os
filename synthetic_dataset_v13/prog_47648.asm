; DESCRIPTION: Creates a cyan rectangular region at (39, 37) spanning 14 by 94 pixels.
; PLAN: r0=39(x), r1=37(y), r2=14(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 37
LDI r2, 14
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
