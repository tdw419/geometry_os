; DESCRIPTION: Creates a cyan rectangular region at (401, 11) spanning 108 by 93 pixels.
; PLAN: r0=401(x), r1=11(y), r2=108(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 11
LDI r2, 108
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
