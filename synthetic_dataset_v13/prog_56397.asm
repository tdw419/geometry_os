; DESCRIPTION: Creates a cyan rectangular region at (380, 84) spanning 94 by 29 pixels.
; PLAN: r0=380(x), r1=84(y), r2=94(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 84
LDI r2, 94
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
