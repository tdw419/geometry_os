; DESCRIPTION: Creates a cyan rectangular region at (475, 184) spanning 27 by 34 pixels.
; PLAN: r0=475(x), r1=184(y), r2=27(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 184
LDI r2, 27
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
