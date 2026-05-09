; DESCRIPTION: Creates a cyan rectangular region at (212, 109) spanning 75 by 56 pixels.
; PLAN: r0=212(x), r1=109(y), r2=75(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 109
LDI r2, 75
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
