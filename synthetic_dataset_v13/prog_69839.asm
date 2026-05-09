; DESCRIPTION: Creates a cyan rectangular region at (44, 44) spanning 83 by 30 pixels.
; PLAN: r0=44(x), r1=44(y), r2=83(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 44
LDI r2, 83
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
