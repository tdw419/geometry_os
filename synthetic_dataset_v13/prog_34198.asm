; DESCRIPTION: Creates a cyan rectangular region at (350, 99) spanning 56 by 34 pixels.
; PLAN: r0=350(x), r1=99(y), r2=56(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 99
LDI r2, 56
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
