; DESCRIPTION: Creates a cyan rectangular region at (172, 18) spanning 11 by 27 pixels.
; PLAN: r0=172(x), r1=18(y), r2=11(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 18
LDI r2, 11
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
