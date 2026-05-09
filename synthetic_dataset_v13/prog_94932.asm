; DESCRIPTION: Creates a cyan rectangular region at (305, 30) spanning 46 by 56 pixels.
; PLAN: r0=305(x), r1=30(y), r2=46(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 30
LDI r2, 46
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
