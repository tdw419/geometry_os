; DESCRIPTION: Creates a cyan rectangular region at (225, 69) spanning 57 by 10 pixels.
; PLAN: r0=225(x), r1=69(y), r2=57(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 69
LDI r2, 57
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
