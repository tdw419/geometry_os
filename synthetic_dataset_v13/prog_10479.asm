; DESCRIPTION: Creates a cyan rectangular region at (130, 4) spanning 99 by 11 pixels.
; PLAN: r0=130(x), r1=4(y), r2=99(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 4
LDI r2, 99
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
