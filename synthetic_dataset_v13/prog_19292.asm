; DESCRIPTION: Creates a cyan rectangular region at (23, 156) spanning 109 by 87 pixels.
; PLAN: r0=23(x), r1=156(y), r2=109(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 156
LDI r2, 109
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
