; DESCRIPTION: Creates a cyan rectangular region at (171, 213) spanning 14 by 31 pixels.
; PLAN: r0=171(x), r1=213(y), r2=14(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 213
LDI r2, 14
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
