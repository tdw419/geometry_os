; DESCRIPTION: Creates a cyan rectangular region at (271, 72) spanning 44 by 106 pixels.
; PLAN: r0=271(x), r1=72(y), r2=44(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 72
LDI r2, 44
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
