; DESCRIPTION: Creates a cyan rectangular region at (18, 18) spanning 40 by 39 pixels.
; PLAN: r0=18(x), r1=18(y), r2=40(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 18
LDI r2, 40
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
