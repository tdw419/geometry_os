; DESCRIPTION: Creates a cyan rectangular region at (221, 87) spanning 70 by 101 pixels.
; PLAN: r0=221(x), r1=87(y), r2=70(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 87
LDI r2, 70
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
