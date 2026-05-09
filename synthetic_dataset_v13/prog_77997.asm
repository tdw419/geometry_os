; DESCRIPTION: Creates a cyan rectangular region at (90, 100) spanning 56 by 91 pixels.
; PLAN: r0=90(x), r1=100(y), r2=56(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 100
LDI r2, 56
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
