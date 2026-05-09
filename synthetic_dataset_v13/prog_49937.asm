; DESCRIPTION: Creates a cyan rectangular region at (361, 18) spanning 85 by 39 pixels.
; PLAN: r0=361(x), r1=18(y), r2=85(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 18
LDI r2, 85
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
