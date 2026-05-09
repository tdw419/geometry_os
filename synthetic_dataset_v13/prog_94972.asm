; DESCRIPTION: Creates a cyan rectangular region at (451, 143) spanning 61 by 27 pixels.
; PLAN: r0=451(x), r1=143(y), r2=61(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 143
LDI r2, 61
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
