; DESCRIPTION: Creates a cyan rectangular region at (39, 69) spanning 27 by 110 pixels.
; PLAN: r0=39(x), r1=69(y), r2=27(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 69
LDI r2, 27
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
