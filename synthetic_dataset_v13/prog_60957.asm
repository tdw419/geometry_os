; DESCRIPTION: Creates a cyan rectangular region at (374, 94) spanning 57 by 62 pixels.
; PLAN: r0=374(x), r1=94(y), r2=57(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 94
LDI r2, 57
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
