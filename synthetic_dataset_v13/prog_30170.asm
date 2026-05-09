; DESCRIPTION: Creates a cyan rectangular region at (268, 58) spanning 108 by 91 pixels.
; PLAN: r0=268(x), r1=58(y), r2=108(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 58
LDI r2, 108
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
