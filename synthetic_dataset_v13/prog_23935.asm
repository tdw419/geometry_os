; DESCRIPTION: Creates a cyan rectangular region at (162, 116) spanning 57 by 94 pixels.
; PLAN: r0=162(x), r1=116(y), r2=57(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 116
LDI r2, 57
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
