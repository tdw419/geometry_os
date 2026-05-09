; DESCRIPTION: Creates a cyan rectangular region at (56, 159) spanning 31 by 95 pixels.
; PLAN: r0=56(x), r1=159(y), r2=31(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 159
LDI r2, 31
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
