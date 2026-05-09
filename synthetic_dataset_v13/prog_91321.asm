; DESCRIPTION: Creates a cyan rectangular region at (149, 19) spanning 27 by 18 pixels.
; PLAN: r0=149(x), r1=19(y), r2=27(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 19
LDI r2, 27
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
