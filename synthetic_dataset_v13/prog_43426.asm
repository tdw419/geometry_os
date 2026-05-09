; DESCRIPTION: Creates a cyan rectangular region at (367, 15) spanning 30 by 65 pixels.
; PLAN: r0=367(x), r1=15(y), r2=30(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 15
LDI r2, 30
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
