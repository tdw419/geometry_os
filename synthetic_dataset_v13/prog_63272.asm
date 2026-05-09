; DESCRIPTION: Creates a cyan rectangular region at (182, 207) spanning 56 by 33 pixels.
; PLAN: r0=182(x), r1=207(y), r2=56(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 207
LDI r2, 56
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
