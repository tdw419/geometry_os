; DESCRIPTION: Creates a cyan rectangular region at (105, 65) spanning 105 by 83 pixels.
; PLAN: r0=105(x), r1=65(y), r2=105(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 65
LDI r2, 105
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
