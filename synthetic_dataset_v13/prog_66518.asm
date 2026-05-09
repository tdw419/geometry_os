; DESCRIPTION: Creates a cyan rectangular region at (160, 56) spanning 91 by 86 pixels.
; PLAN: r0=160(x), r1=56(y), r2=91(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 56
LDI r2, 91
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
