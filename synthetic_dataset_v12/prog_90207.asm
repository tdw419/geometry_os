; DESCRIPTION: Creates a cyan rectangular region at (367, 27) spanning 28 by 18 pixels.
; PLAN: r0=367(x), r1=27(y), r2=28(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 27
LDI r2, 28
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
